import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/repos/employee_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// employee repo provider
final employeeRepoProvider = Provider<EmployeeRepo>((ref) {
  return EmployeeRepo(baseUrl: "https://hr-mgt-system.onrender.com");
});

// dummy employees data provider
final dummyEmployeeDataProvider =
    FutureProvider.autoDispose<List<EmployeeModel>?>((ref) async {
  return ref.watch(employeeRepoProvider).getDummyData();
});

// get all employees provider
final getAllEmployeesProvider =
    FutureProvider.autoDispose<List<EmployeeModel>?>((ref) async {
  return ref.watch(employeeRepoProvider).getAllEmployees();
});
