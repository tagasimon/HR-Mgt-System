# users Blueprint

from flask import Blueprint, request, jsonify, current_app

employees_bp = Blueprint('employees', __name__)
# Route for retrieving all employees (no employee_number)
@employees_bp.route('/employees', methods=['GET'])
def get_all_employees():
    try:
        employees = [
            {
                "employeeNumber": 1,
                "firstName": "John",
                "lastName": "Doe",
                "email": "",
                "idPhoto": "#"
            },
            {
                "employeeNumber": 2,
                "firstName": "Jane",
                "lastName": "Doe",
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
            "employeeNumber": employee_number,
            "firstName": "John",
            "lastName": "Doe",
            "email": "smka@gmail.com",
            "idPhoto": "#"
        }
        return jsonify(employee)
    except Exception as e:
        return jsonify({"error": str(e)}), 500