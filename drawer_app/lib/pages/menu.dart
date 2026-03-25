import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            )
          ],
        )
    );
  }
}