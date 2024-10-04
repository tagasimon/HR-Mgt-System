import 'package:client_app/features/employee/presentation/notifiers/show_table_notifier.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleViewWid extends ConsumerWidget {
  const ToggleViewWid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTable = ref.watch(showTableNotifierProvider);
    return DropdownButton(
      value: showTable,
      items: const [
        DropdownMenuItem(value: false, child: Text('Table')),
        DropdownMenuItem(value: true, child: Text('List')),
      ],
      onChanged: (value) {
        ref.watch(showTableNotifierProvider.notifier).toggle();
      },
    );
  }
}
