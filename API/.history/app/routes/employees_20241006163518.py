# users Blueprint

from flask import Blueprint, request, jsonify, current_app
from flask import Flask, request, jsonify
from werkzeug.security import check_password_hash
from app.models.employee import Employee
from utils.utils import generate_employee_number, encode_image
import base64
from app.database import db_session
import os


employees_bp = Blueprint('employees', __name__)
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