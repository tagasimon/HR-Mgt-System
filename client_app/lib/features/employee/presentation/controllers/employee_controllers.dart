import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/providers/empoyee_providers.dart';
import 'package:client_app/features/employee/repos/employee_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// employee controllers provider
final employeeControllersProvider =
    StateNotifierProvider<EmployeeControllers, AsyncValue>((ref) {
  return EmployeeControllers(ref.watch(employeeRepoProvider));
});

class EmployeeControllers extends StateNotifier<AsyncValue> {
  final EmployeeRepo _repo;
  EmployeeControllers(this._repo) : super(const AsyncData(null));

  // add employee
  Future<bool> addEmployee(EmployeeModel employee) async {
    state = const AsyncLoading();
    try {
      await _repo.createEmployee(employee);
      state = const AsyncData(null);
      return true;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }

  // update employee
  Future<bool> updateEmployee(EmployeeModel employee) async {
    state = const AsyncLoading();
    try {
      await _repo.updateEmployee(employee);
      state = const AsyncData(null);
      return true;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }

  // delete employee
  Future<bool> deleteEmployee(String employeeId) async {
    state = const AsyncLoading();
    try {
      await _repo.deleteEmployee(employeeId);
      state = const AsyncData(null);
      return true;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }
}
