import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/presentation/screens/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeListWid extends ConsumerWidget {
  final List<EmployeeModel> data;
  const EmployeeListWid(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, index) => Card(
        child: ListTile(
          leading: data[index].id_photo == null
              ? const Icon(Icons.person)
              : CircleAvatar(
                  backgroundImage: NetworkImage(data[index].id_photo!),
                ),
          title: Text(data[index].surname ?? ""),
          subtitle: Text(data[index].other_names ?? ""),
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditEmployeeScreen(data[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
