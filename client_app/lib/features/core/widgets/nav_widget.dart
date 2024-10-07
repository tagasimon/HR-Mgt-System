import 'package:client_app/features/admin/ui/screens/api_requests_screen.dart';
import 'package:client_app/features/core/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavWidget extends ConsumerStatefulWidget {
  const NavWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends ConsumerState<NavWidget> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ApiRequestsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          fontSize: 10,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
        ],
      ),
    );
  }
}
