import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/presentation/screens/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EmployeeTableWid extends ConsumerWidget {
  final List<EmployeeModel> data;
  const EmployeeTableWid(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dFormat = DateFormat('dd/MM/yyyy');
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showBottomBorder: true,
          columns: const [
            DataColumn(label: Text('Surname')),
            DataColumn(label: Text('Other Names')),
            DataColumn(label: Text('Date of Birth')),
          ],
          rows: data
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditEmployeeScreen(e),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit, color: Colors.green),
                        label: Text(
                          e.surname,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    DataCell(Text(e.otherNames)),
                    DataCell(Text(dFormat.format(e.dob as DateTime))),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
