import 'package:client_app/features/admin/ui/screens/api_requests_screen.dart';
import 'package:client_app/features/core/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebNavWidget extends ConsumerStatefulWidget {
  const WebNavWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebNavWidgetState();
}

class _WebNavWidgetState extends ConsumerState<WebNavWidget> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ApiRequestsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home_filled),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.admin_panel_settings),
              selectedIcon: Icon(Icons.admin_panel_settings),
              label: Text('Admin'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _screens[_currentIndex]),
      ],
    ));
  }
}
