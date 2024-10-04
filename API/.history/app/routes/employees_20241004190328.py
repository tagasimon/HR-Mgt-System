# users Blueprint

from flask import Blueprint, request, jsonify, current_app

employees_bp = Blueprint('employees', __name__)
# Route for retrieving all employees (no employee_number)
@employees_bp.route('/employees', methods=['GET'])
def get_all_employees():
    try:
        employees = [
            {
                "employee_number": 1,
                "first_name": "John",
                "last_name": "Doe",
                "email": "",
                "idPhoto": "#"
            },
            {
                "employee_number": 2,
                "first_name": "Jane",
                "last_name": "Doe",
                "email": "",
                "idPhoto": "#"
            }
        ]
        return jsonify(employees)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# Route for retrieving a specific employee by employee_number
@employees_bp.route('/employees/<employee_number>', methods=['GET'])
def get_employee(employee_number):
    try:
        employee = {
            "employee_number": employee_number,
            "first_name": "John",
            "last_name": "Doe",
            "email": "smka@gmail.com",
            "idPhoto": "#"
        }
        return jsonify(employee)
    except Exception as e:
        return jsonify({"error": str(e)}), 500