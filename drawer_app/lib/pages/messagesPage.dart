import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.person_2_sharp),
                  title: Text('Jane Doe'),
                  subtitle: Text('Why did you get fired!?'),
                ),
              ),
              Card(
                child: ListTile(
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