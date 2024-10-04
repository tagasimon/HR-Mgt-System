import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/providers/empoyee_providers.dart';
import 'package:client_app/features/employee/repos/user_repo.dart';
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
      // TODO Use _repo to add employee
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
      // TODO Use _repo to update employee
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
      // TODO Use _repo to delete employee
      return true;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }
}
