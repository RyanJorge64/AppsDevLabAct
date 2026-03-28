import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            const Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
            ),
            const Card(
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