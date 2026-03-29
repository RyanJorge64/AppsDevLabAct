import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: const ListTile(
                  leading: Icon(Icons.person_2_sharp),
                  title: Text('Jane Doe'),
                  subtitle: Text('Why did you get fired!?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: const ListTile(
                  leading: Icon(Icons.person_4_sharp),
                  title: Text('Billy'),
                  subtitle: Text('Boss, said you\'re fired'),
                ),
              ),
            ],
          ),
        )
    );
  }
}