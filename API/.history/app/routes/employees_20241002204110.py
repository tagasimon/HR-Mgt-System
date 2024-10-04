# users Blueprint

from flask import Blueprint, request, jsonify, current_app

employees_bp = Blueprint('employees', __name__)


@employees_bp.route('/employees/<employee_number>', methods=['GET'])
def get_employees():
    db = current_app.db
    try:
        # region = request.args.get('region')
        
        # if employee_number is not provided, return all employees
        if not employee_number:
            employees = db.employees.find()
            return jsonify([employee for employee in employees])
    except Exception as e:
        return jsonify({"error": str(e)}), 500
