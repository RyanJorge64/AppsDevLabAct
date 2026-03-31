import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChatPage(
                        name: 'Jane Doe',
                        heroTag: 'jane',
                      ),
                    ),
                  );
                },
                leading: const Hero(
                  tag: 'jane',
                  child: CircleAvatar(
                    child: Icon(Icons.person_2_sharp),
                  ),
                ),
                title: const Text('Jane Doe'),
                subtitle: const Text(
                  'Why did you get fired!?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChatPage(
                        name: 'Billy',
                        heroTag: 'billy',
                      ),
                    ),
                  );
                },
                leading: const Hero(
                  tag: 'billy',
                  child: CircleAvatar(
                    child: Icon(Icons.person_4_sharp),
                  ),
                ),
                title: const Text('Billy'),
                subtitle: const Text('Boss, said you\'re fired'),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChatPage(
                        name: 'Alex',
                        heroTag: 'alex',
                      ),
                    ),
                  );
                },
                leading: const Hero(
                  tag: 'alex',
                  child: CircleAvatar(
                    child: Icon(Icons.person_3_sharp),
                  ),
                ),
                title: const Text('Alex'),
                subtitle: const Text('Wanna hang out later?'),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChatPage(
                        name: 'Jack',
                        heroTag: 'jack',
                      ),
                    ),
                  );
                },
                leading: const Hero(
                  tag: 'jack',
                  child: CircleAvatar(
                    child: Icon(Icons.person_2_sharp),
                  ),
                ),
                title: const Text('Jack'),
                subtitle: const Text('Check out this cool photo I took!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String name;
  final String heroTag;

  const ChatPage({
    super.key,
    required this.name,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: heroTag,
              child: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            const SizedBox(width: 12),
            Text(name),
          ],
        ),
      ),
      body: const Center(
        child: Text('Chat messages go here'),
      ),
    );
  }
}