// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/repos/employee_service.dart';
import 'package:http/http.dart' as http;

class EmployeeRepo extends EmployeeService {
  final String baseUrl;
  EmployeeRepo({required this.baseUrl});

  @override
  Future<String> createEmployee(EmployeeModel employee) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: employee.toMap(),
    );
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to register staff');
    }
  }

  @override
  Future<String?> deleteEmployee(String userId) {
    // TODO: implement deleteEmployee
    throw UnimplementedError();
  }

  @override
  Future<List<EmployeeModel>?> getAllEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/api/staff'));
    if (response.statusCode == 200) {
      List<dynamic> employees = jsonDecode(response.body);
      return employees.map((e) => EmployeeModel.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  @override
  Future<EmployeeModel?> getEmployeeById(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<String> updateEmployee(EmployeeModel employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/staff/${employee.employee_number}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'date_of_birth': employee.date_of_birth,
        'id_photo': employee.id_photo,
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to update employee');
    }
  }

  @override
  Future<List<EmployeeModel>> getDummyData() {
    List<EmployeeModel> dummyEmployees = [
      EmployeeModel(
        employee_number: "001",
        surname: "Employee1",
        other_names: "Employee Other Name 1",
        date_of_birth: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "002",
        surname: "Employee2",
        other_names: "Employee Other Name 2",
        date_of_birth: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "003",
        surname: "Employee3",
        other_names: "Employee Other Name 3",
        date_of_birth: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "004",
        surname: "Employee4",
        other_names: "Employee Other Name 4",
        date_of_birth: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "005",
        surname: "Employee5",
        other_names: "Employee Other Name 5",
        date_of_birth: DateTime(1990, 1, 1),
      ),
    ];

    // Simulate a network delay
    return Future.delayed(const Duration(seconds: 1), () => dummyEmployees);
  }
}
