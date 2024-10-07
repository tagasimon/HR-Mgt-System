import os
from flask import Blueprint, request, jsonify, current_app
from app.models.employee import Employee
from app.models.api_request import APIRequest
from app.utils import generate_employee_number, encode_image
employees_bp = Blueprint('employees', __name__)

@employees_bp.route('/api/register', methods=['POST'])
def register_staff():
    """
    Registers a new staff member by processing form data, validating required fields, 
    encoding an optional ID photo, generating an employee number, and saving the employee 
    information to a Firestore database.
    Returns:
        Response: A JSON response indicating success or failure of the registration process.
    Possible Responses:
        - 201: Staff registration successful with the generated employee number.
        - 400: Missing required fields, invalid unique code, or error processing the ID photo.
        - 500: Error saving the employee to the database.
    Form Fields:
        - surname (str): The surname of the staff member.
        - other_names (str): The other names of the staff member.
        - date_of_birth (str): The date of birth of the staff member.
        - unique_code (str): A unique code for the staff member.
        - id_photo (str, optional): A base64 encoded image string or a file representing the ID photo.
    Raises:
        Exception: If there is an error processing the ID photo or saving the employee to the database.
    """
    # Get data from form fields
    surname = request.form.get('surname')
    other_names = request.form.get('other_names')
    date_of_birth = request.form.get('date_of_birth')
    unique_code = request.form.get('unique_code')
    id_photo = request.form.get('id_photo')  # This can be base64 encoded image string or a file
    
    # Validate required fields
    required_fields = ['surname', 'other_names', 'date_of_birth', 'unique_code']
    missing_fields = [field for field in required_fields if not request.form.get(field)]
    if missing_fields:
        return jsonify({'message': f'Missing fields: {", ".join(missing_fields)}'}), 400

    # Validate unique code
    if not validate_unique_code(unique_code):
        return jsonify({'message': 'Invalid unique code.'}), 400

    # Optionally handle ID Photo
    id_photo_encoded = None
    if id_photo:
        try:
            id_photo_encoded = encode_image(id_photo)  # Encode image to base64 if necessary
        except Exception as e:
            return jsonify({'message': f'Error processing image: {str(e)}'}), 400

    # Generate employee number
    employee_number = generate_employee_number()

    # Create employee object
    new_employee = Employee(
        surname=surname,
        other_names=other_names,
        date_of_birth=date_of_birth,
        employee_number=employee_number,
        id_photo=id_photo_encoded
    )

    # Save employee to database (Firestore)
    try:
        db = current_app.db
        db.collection('EMPLOYEES').document(employee_number).set(new_employee.serialize())
        # if success, save to API request to database
        api_request = APIRequest(name='register_staff', status='success', message='Staff registration successful.')
        db.collection('API_REQUESTS').add(api_request.serialize())
    except Exception as e:
        # if error, save to API request to database
        api_request = APIRequest(name='register_staff', status='error', message=f'Error saving employee to database: {str(e)}')
        db.collection('API_REQUESTS').add(api_request.serialize())
        return jsonify({'message': f'Error saving employee to database: {str(e)}'}), 500

    return jsonify({
        'message': 'Staff registration successful.',
        'employee_number': employee_number
    }), 201

# Staff Retrieval API
@employees_bp.route('/api/staff', methods=['GET'])
def get_staff():
    """
    Retrieve employee data from the database.

    This function fetches employee data based on the provided employee number
    from the request arguments. If an employee number is provided, it retrieves
    the specific employee's data. If no employee number is provided, it retrieves
    data for all employees.

    Returns:
        Response: A JSON response containing the employee data and an HTTP status code 200.
    """
    db = current_app.db
    employee_number = request.args.get('employee_number')

    if employee_number:
        # employee = Employee.query.filter_by(employee_number=employee_number).first()
        collection_ref = db.collection('EMPLOYEES').where('employee_number', '==', employee_number)
        docs = collection_ref.stream()
        data = []
        for doc in docs:
            data.append(doc.to_dict())
        api_request = APIRequest(name='get_staff', status='success', message='Staff retrieved successfully.')
        db.collection('API_REQUESTS').add(api_request.serialize())
        return jsonify(data), 200
    else:
        collection_ref = db.collection('EMPLOYEES')
        docs = collection_ref.stream()
        data = []
        for doc in docs:
            data.append(doc.to_dict())
        api_request = APIRequest(name='get_staff', status='success', message='Staff retrieved successfully.')
        db.collection('API_REQUESTS').add(api_request.serialize())
        return jsonify(data), 200
    
# Staff Update API
@employees_bp.route('/api/staff/<employee_number>', methods=['PUT'])
def update_staff(employee_number):
    """
    Update the details of an employee in the Firestore database.
    Args:
        employee_number (str): The unique identifier of the employee to update.
    Returns:
        Response: A Flask JSON response indicating the result of the update operation.
            - 200: Employee updated successfully.
            - 400: No fields to update or error processing image.
            - 404: Employee not found.
            - 500: Error updating employee in Firestore.
    Notes:
        - The function expects form data to be available in the request context.
        - The 'date_of_birth' and 'id_photo' fields are optional and will be updated if present in the form data.
        - The 'id_photo' field, if present, will be encoded using the `encode_image` function.
    """
    # Get data from form fields
    db = current_app.db
    employee_ref = db.collection('EMPLOYEES').document(employee_number)
    employee_doc = employee_ref.get()

    if not employee_doc.exists:
        return jsonify({'message': 'Employee not found.'}), 404

    # Prepare updates
    updates = {}    
    # Update fields if present in the form data
    if 'date_of_birth' in request.form:
        updates['date_of_birth'] = request.form['date_of_birth']
    
    if 'id_photo' in request.form:
        try:
            updates['id_photo'] = encode_image(request.form['id_photo'])  # Encode image if necessary
        except Exception as e:
            return jsonify({'message': f'Error processing image: {str(e)}'}), 400
    
    # If there are updates, proceed to update Firestore
    if updates:
        try:
            employee_ref.update(updates)  # Update employee document in Firestore
            api_request = APIRequest(name='update_staff', status='success', message='Employee updated successfully.')
            db.collection('API_REQUESTS').add(api_request.serialize())
            return jsonify({'message': 'Employee updated successfully.'}), 200
        except Exception as e:
            api_request = APIRequest(name='update_staff', status='error', message=f'Error updating employee: {str(e)}')
            db.collection('API_REQUESTS').add(api_request.serialize())
            return jsonify({'message': f'Error updating employee: {str(e)}'}), 500

    return jsonify({'message': 'No fields to update.'}), 400

# Unique Code Validation Function
def validate_unique_code(code):
    """
    Validate if the provided code matches the unique code stored in the environment variable.

    Args:
        code (str): The code to be validated.

    Returns:
        bool: True if the provided code matches the unique code, False otherwise.
    """
    return code == os.getenv('UNIQUE_CODE')