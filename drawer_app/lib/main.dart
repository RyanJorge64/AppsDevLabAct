import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer & NavBar',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: const NavigationExample(),
    );
  }
}


class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      appBar: AppBar(
        title: const Text('Drawer & NavBar',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF086CBE),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        backgroundColor: Color(0xFF086CBE),
        indicatorColor: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.4),
        labelTextStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
            Icons.home,
            color: Colors.white),
            icon: Icon(
            Icons.home_outlined,
            color: Colors.white,), 
            label: 'Home',),
          NavigationDestination(
            selectedIcon: Icon(Icons.mail,
            color: Colors.white,),
            icon: Icon(
            Icons.mail_outline,
            color: Colors.white,),
            label: 'Messages'),
          NavigationDestination(
            selectedIcon: Icon(
            Icons.notifications,
            color: Colors.white,),
            icon: Icon(
            Icons.notifications_none,
            color: Colors.white,),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.menu_open
            ,color: Colors.white,),
            icon: Icon(
            Icons.menu,
            color: Colors.white,),
            label: 'Menu',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text('This is the Home page', style: theme.textTheme.titleLarge),
            ),
          ),
        ),

        /// Messages page
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
        ),

        // Notifications page
        Scaffold(
          body: Center(
            child: Text('This is the Notifications page', style: theme.textTheme.titleLarge),
          ),
        ),
        
        // Menu page
        const Column(
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

      ][currentPageIndex],
      drawer: Drawer(
        child: IconTheme(
          data: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text('User: John Doe'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    )
    );
  }
}

