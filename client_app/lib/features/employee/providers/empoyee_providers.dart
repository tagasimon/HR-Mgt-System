import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/repos/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// employee repo provider
final employeeRepoProvider = Provider<EmployeeRepo>((ref) {
  return EmployeeRepo();
});

// dummy employees data provider
final dummyEmployeeDataProvider =
    FutureProvider.autoDispose<List<EmployeeModel>?>((ref) async {
  return ref.watch(employeeRepoProvider).getDummyData();
});
