import 'package:client_app/features/employee/presentation/screens/add_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client_app/features/employee/presentation/notifiers/show_table_notifier.dart';
import 'package:client_app/features/employee/providers/empoyee_providers.dart';
import 'package:client_app/features/employee/presentation/widgets/employee_list_wid.dart';
import 'package:client_app/features/employee/presentation/widgets/employee_table_wid.dart';
import 'package:client_app/features/employee/presentation/widgets/toggle_view_wid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeesProv = ref.watch(dummyEmployeeDataProvider);
    final showTable = ref.watch(showTableNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMPLOYEES'),
        centerTitle: true,
        actions: const [ToggleViewWid()],
      ),
      body: employeesProv.when(
        data: (data) {
          if (data == null) {
            return const Center(child: Text('No data'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (showTable) Expanded(child: EmployeeTableWid(data)),
              if (!showTable) Expanded(child: EmployeeListWid(data))
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddEmployeeScreen()));
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Employee'),
      ),
    );
  }
}
