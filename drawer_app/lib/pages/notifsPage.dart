import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the Notifications page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}