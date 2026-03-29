import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      backgroundColor: const Color(0xFF086CBE),
      indicatorColor: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.4),
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(color: Colors.white),
      ),
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home, color: Colors.white),
          icon: Icon(Icons.home_outlined, color: Colors.white),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.mail, color: Colors.white),
          icon: Badge(
            label: Text('1'),
            child: Icon(Icons.mail_outline, color: Colors.white),
          ),
          label: 'Messages',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.notifications, color: Colors.white),
          icon: Icon(Icons.notifications_none, color: Colors.white),
          label: 'Notifications',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.menu_open, color: Colors.white),
          icon: Icon(Icons.menu, color: Colors.white),
          label: 'Menu',
        ),
      ],
    );
  }
}
