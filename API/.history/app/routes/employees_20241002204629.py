# users Blueprint

from flask import Blueprint, request, jsonify, current_app

employees_bp = Blueprint('employees', __name__)

@employees_bp.route('/employees/<employee_number>', methods=['GET'])
def get_employees(employee_number):
    db = current_app.db
    try:
        # If employee_number is not provided, return all employees
        # In this case, employee_number is always provided as per the route, but you can set a condition for None.
        if not employee_number:
            employees = [
                {
                    "employee_number": 1,
                    "first_name": "John",
                    "last_name": "Doe",
                    "email": ""
                },
                {
                    "employee_number": 2,
                    "first_name": "Jane",
                    "last_name": "Doe",
                    "email": ""
                }
            ]
            return jsonify(employees)

        # If employee_number is provided, return the specific employee
        employee = {
            "employee_number": employee_number,
            "first_name": "John",
            "last_name": "Doe",
            "email": "smka@gmail.com"
        }
        return jsonify(employee)

    except Exception as e:
        return jsonify({"error": str(e)}), 500