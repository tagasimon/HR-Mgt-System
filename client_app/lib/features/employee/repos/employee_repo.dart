import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/repos/employee_service.dart';

class EmployeeRepo extends EmployeeService {
  @override
  Future<void> createEmployee(EmployeeModel employee) {
    // TODO: implement createEmployee
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEmployee(String userId) {
    // TODO: implement deleteEmployee
    throw UnimplementedError();
  }

  @override
  Future<List<EmployeeModel>?> getAllEmployees() {
    // TODO: implement getAllEmployees
    throw UnimplementedError();
  }

  @override
  Future<EmployeeModel?> getEmployeeById(String userId) {
    // TODO: implement getEmployeeById
    throw UnimplementedError();
  }

  @override
  Future<void> updateEmployee(EmployeeModel employee) {
    // TODO: implement updateEmployee
    throw UnimplementedError();
  }

  @override
  Future<List<EmployeeModel>> getDummyData() {
    List<EmployeeModel> dummyEmployees = [
      EmployeeModel(
        employee_number: "001",
        surname: "Employee1",
        otherNames: "Employee Other Name 1",
        dob: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "002",
        surname: "Employee2",
        otherNames: "Employee Other Name 2",
        dob: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "003",
        surname: "Employee3",
        otherNames: "Employee Other Name 3",
        dob: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "004",
        surname: "Employee4",
        otherNames: "Employee Other Name 4",
        dob: DateTime(1990, 1, 1),
      ),
      EmployeeModel(
        employee_number: "005",
        surname: "Employee5",
        otherNames: "Employee Other Name 5",
        dob: DateTime(1990, 1, 1),
      ),
    ];

    // Simulate a network delay
    return Future.delayed(const Duration(seconds: 1), () => dummyEmployees);
  }
}
