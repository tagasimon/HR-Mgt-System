import 'package:client_app/features/employee/models/employee_model.dart';

abstract class EmployeeService {
  Future<void> createEmployee(EmployeeModel employee);
  Future<void> updateEmployee(EmployeeModel employee);
  Future<void> deleteEmployee(String userId);
  Future<EmployeeModel?> getEmployeeById(String userId);
  Future<List<EmployeeModel>?> getAllEmployees();
  Future<List<dynamic>> getDummyData();
}
