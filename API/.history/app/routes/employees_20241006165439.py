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


# Staff Retrieval API
@employees_bp.route('/api/staff', methods=['GET'])
def get_staff():
    employee_number = request.args.get('employee_number')

    if employee_number:
        employee = Employee.query.filter_by(employee_number=employee_number).first()
        if employee:
            return jsonify(employee.serialize()), 200
        else:
            return jsonify({'message': 'Employee not found.'}), 404
    else:
        employees = Employee.query.all()
        return jsonify([emp.serialize() for emp in employees]), 200


# Staff Update API
@employees_bp.route('/api/staff/<employee_number>', methods=['PUT'])
def update_staff(employee_number):
    data = request.json

    employee = Employee.query.filter_by(employee_number=employee_number).first()
    if not employee:
        return jsonify({'message': 'Employee not found.'}), 404

    # Update fields if present
    if 'date_of_birth' in data:
        employee.date_of_birth = data['date_of_birth']
    if 'id_photo' in data:
        try:
            employee.id_photo = encode_image(data['id_photo'])
        except Exception as e:
            return jsonify({'message': 'Error processing image.'}), 400

    db_session.commit()
    return jsonify({'message': 'Employee updated successfully.'}), 200


# Unique Code Validation Function
def validate_unique_code(code):
    # Simulate code validation
    return code == os.getenv('UNIQUE_CODE')  # Replace with actual validation logic


# Error handling
@employees_bp.errorhandler(404)
def not_found(e):
    return jsonify({'message': 'Resource not found.'}), 404

@employees_bp.errorhandler(500)
def internal_server_error(e):
    return jsonify({'message': 'An error occurred.'}), 500