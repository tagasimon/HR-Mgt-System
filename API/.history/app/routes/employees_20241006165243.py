# users Blueprint

from flask import Blueprint, request, jsonify, current_app
from flask import Flask, request, jsonify
from werkzeug.security import check_password_hash
from app.models.employee import Employee
from app.utils import generate_employee_number, encode_image
import base64
from app.database import db_session
import os


employees_bp = Blueprint('employees', __name__)
@employees_bp.route('/api/register', methods=['POST'])
def register_staff():
    data = request.json

    required_fields = ['surname', 'other_names', 'date_of_birth', 'unique_code']
    for field in required_fields:
        if field not in data:
            return jsonify({'message': f'{field} is required.'}), 400

    # Validate unique code
    if not validate_unique_code(data['unique_code']):
        return jsonify({'message': 'Invalid unique code.'}), 400

    # Optionally handle ID Photo
    if 'id_photo' in data:
        try:
            id_photo_encoded = encode_image(data['id_photo'])  # Encode image to base64
        except Exception as e:
            return jsonify({'message': 'Error processing image.'}), 400
    else:
        id_photo_encoded = None

    # Generate employee number
    employee_number = generate_employee_number()

    # Create employee object
    new_employee = Employee(
        surname=data['surname'],
        other_names=data['other_names'],
        date_of_birth=data['date_of_birth'],
        employee_number=employee_number,
        id_photo=id_photo_encoded
    )

    db_session.add(new_employee)
    db_session.commit()

    return jsonify({
        'message': 'Staff registration successful.',
        'employee_number': employee_number
    }), 201



@employees_bp.route('/employees/<employee_number>', methods=['GET'])
def get_employee(employee_number):
    try:
        employee = {
            "employeeNumber": employee_number,
            "firstName": "John",
            "lastName": "Doe",
            "email": "smka@gmail.com",
            "idPhoto": "#"
        }
        return jsonify(employee)
    except Exception as e:
        return jsonify({"error": str(e)}), 500