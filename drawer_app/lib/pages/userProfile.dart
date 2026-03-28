import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showPosts = true;

  ElevatedButton _buildToggleButton(
    String label,
    bool selected,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selected
            ? Colors.lightBlueAccent
            : Colors.grey.shade200,
        foregroundColor: selected ? Colors.white : Colors.black,
        elevation: selected ? 4 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('User Profile'),
      backgroundColor: Colors.lightBlueAccent,
      centerTitle: false,
    ),
    body: Column(
      children: [
        // PROFILE CARD
        Card(
          elevation: 1,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/defaultProfile.jpg'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  '@thefirstuserjohndoe',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // TOGGLE BUTTONS
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildToggleButton(
                  'Posts',
                  showPosts,
                  () => setState(() => showPosts = true),
                ),
                _buildToggleButton(
                  'About',
                  !showPosts,
                  () => setState(() => showPosts = false),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // CONTENT AREA (IMPORTANT: Expanded + scroll)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: showPosts ? _buildPosts() : _buildAbout(),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPosts() {
  final posts = [
    "Hello everyone! 👋",
  ];

  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      return Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(posts[index]),
        ),
      );
    },
  );
}

Widget _buildAbout() {
  return ListView(
    children: const [
      Card(
        child: ListTile(
          title: Text('Email'),
          subtitle: Text('johndoe@email.com'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Location'),
          subtitle: Text('Philippines'),
        ),
      ),
      Card(
        child: ListTile(
          title: Text('Bio'),
          subtitle: Text('Aspiring mobile developer'),
        ),
      ),
    ],
  );
}
}