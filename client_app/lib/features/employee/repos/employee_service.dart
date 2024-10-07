import 'package:client_app/features/employee/models/employee_model.dart';

abstract class EmployeeService {
  Future<String?> createEmployee(EmployeeModel employee);
  Future<String?> updateEmployee(EmployeeModel employee);
  Future<String?> deleteEmployee(String userId);
  Future<EmployeeModel?> getEmployeeById(String userId);
  Future<List<EmployeeModel>?> getAllEmployees();
  Future<List<dynamic>> getDummyData();
}
