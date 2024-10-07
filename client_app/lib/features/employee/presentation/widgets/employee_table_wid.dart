import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/presentation/screens/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeTableWid extends ConsumerWidget {
  final List<EmployeeModel> data;
  const EmployeeTableWid(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            showBottomBorder: true,
            columns: const [
              DataColumn(label: Text('')),
              DataColumn(label: Text('EMPLOYEE NUMBER')),
              DataColumn(label: Text('SURNAME')),
              DataColumn(label: Text('OTHER NAMES')),
              DataColumn(label: Text('DATE OF BIRTH')),
            ],
            rows: data
                .map(
                  (e) => DataRow(
                    cells: [
                      DataCell(
                        e.id_photo == null
                            ? const Icon(Icons.person)
                            : CircleAvatar(
                                backgroundImage: NetworkImage(e.id_photo!),
                              ),
                      ),
                      DataCell(Text(e.employee_number)),
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
                            e.surname ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      DataCell(Text(e.other_names ?? "")),
                      DataCell(Text("${e.date_of_birth}")),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
