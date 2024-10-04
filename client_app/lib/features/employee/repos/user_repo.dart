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
    List<EmployeeModel> dummy = [
      EmployeeModel(
          id: "001",
          surname: "surname 1",
          otherNames: "other names 1",
          dob: DateTime(1990, 1, 1),
          idPhoto: "#"),
      EmployeeModel(
          id: "002",
          surname: "surname 2",
          otherNames: "other names 2",
          dob: DateTime(1990, 1, 1),
          idPhoto: "#"),
      EmployeeModel(
          id: "003",
          surname: "surname 3",
          otherNames: "other names 3",
          dob: DateTime(1990, 1, 1),
          idPhoto: "#"),
    ];

    // Simulate a network delay
    return Future.delayed(const Duration(seconds: 1), () => dummy);
  }
}
