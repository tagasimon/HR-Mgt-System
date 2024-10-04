import 'package:client_app/features/employee/models/employee_model.dart';
import 'package:client_app/features/employee/presentation/controllers/employee_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddEmployeeScreen extends ConsumerStatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  ConsumerState<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends ConsumerState<AddEmployeeScreen> {
  final _key = GlobalKey<FormState>();
  late TextEditingController surnameController;
  late TextEditingController otherNamesController;
  late TextEditingController dobController;
  late TextEditingController idPhotoController;

  @override
  void initState() {
    surnameController = TextEditingController();
    otherNamesController = TextEditingController();
    dobController = TextEditingController();
    idPhotoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    surnameController.dispose();
    otherNamesController.dispose();
    dobController.dispose();
    idPhotoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(employeeControllersProvider, (_, next) {
      if (next.hasError) {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(next.error.toString()),
          duration: const Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: surnameController,
                decoration: const InputDecoration(
                  labelText: 'Surname',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter surname';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: otherNamesController,
                decoration: const InputDecoration(
                  labelText: 'Other Names',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter other names';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      controller: dobController,
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date of birth';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        dobController.text = picked.toString();
                      }
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final scaff = ScaffoldMessenger.of(context);
                    final nav = Navigator.of(context);
                    if (!_key.currentState!.validate()) {
                      return;
                    }
                    final nEmployee = EmployeeModel(
                      id: const Uuid().v4(),
                      surname: surnameController.text,
                      otherNames: otherNamesController.text,
                      dob: DateTime.parse(dobController.text),
                      idPhoto: idPhotoController.text,
                    );

                    final res = await ref
                        .read(employeeControllersProvider.notifier)
                        .addEmployee(nEmployee);
                    if (res) {
                      nav.pop();
                      const snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("SUCCESS!!"),
                        duration: Duration(seconds: 5),
                      );
                      scaff.showSnackBar(snackBar);
                    }
                  },
                  child: const Text('SAVE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
