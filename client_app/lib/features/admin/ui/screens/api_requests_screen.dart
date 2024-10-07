import 'package:client_app/features/admin/providers/api_requests_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiRequestsScreen extends ConsumerWidget {
  const ApiRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiRequestsProv = ref.watch(apiRequestsProvider);
    // return a table of api requests
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Requests"),
      ),
      body: apiRequestsProv.when(
        data: (data) {
          if (data == null) {
            return const Center(child: Text("No data"));
          }
          // return a database table of api requests
          return DataTable(
            columns: const [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("status")),
              DataColumn(label: Text("Message")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Method")),
            ],
            rows: data
                .map(
                  (e) => DataRow(
                    cells: [
                      DataCell(Text(e.name)),
                      DataCell(Text(e.status)),
                      DataCell(Text(e.message)),
                      DataCell(Text("${e.date}")),
                      DataCell(Text(e.method)),
                    ],
                  ),
                )
                .toList(),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
