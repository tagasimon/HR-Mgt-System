import 'package:client_app/features/employee/presentation/controllers/employee_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditCustomerWidget extends ConsumerWidget {
  final String employeeId;
  const EditCustomerWidget(this.employeeId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeControllersProvider);
    return IconButton(
      icon: state.isLoading
          ? const CircularProgressIndicator()
          : const Icon(Icons.delete),
      onPressed: state.isLoading
          ? null
          : () async {
              final scaff = ScaffoldMessenger.of(context);
              final bool? confirm = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Employee'),
                    content: const Text(
                        'Are you sure you want to delete this employee?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
              if (!confirm!) return;
              final res = await ref
                  .read(employeeControllersProvider.notifier)
                  .deleteEmployee(employeeId);
              if (res) {
                const snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("DELETED!!"),
                  duration: Duration(seconds: 5),
                );
                scaff.showSnackBar(snackBar);
              }
            },
    );
  }
}
