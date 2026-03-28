import 'package:flutter/material.dart';
import 'package:drawer_app/pages/homePage.dart';
import 'package:drawer_app/pages/messagesPage.dart';
import 'package:drawer_app/pages/notifsPage.dart';
import 'package:drawer_app/pages/menu.dart';
import 'package:drawer_app/pages/userProfile.dart';
import 'package:drawer_app/transitions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      routes: {
        '/profile': (context) => const Profile(),
      },
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
    late final PageController _pageController;

    @override
    void initState() {
    super.initState();
    _pageController = PageController();
  }

    @override
      void dispose() {
      _pageController.dispose();
      super.dispose();
  }
  
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

void _onDestinationSelected(int index) {
  setState(() {
    currentPageIndex = index;
  });

  _pageController.animateToPage(
    index,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(key: ValueKey<int>(0)),
      MessagesPage(key: ValueKey<int>(1)),
      NotificationsPage(key: ValueKey<int>(2)),
      MenuPage(key: ValueKey<int>(3)),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      appBar: AppBar(
        title: const Text('Drawer & NavBar',
        style: TextStyle(color: Colors.white, 
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto'),
        ),
        backgroundColor: const Color(0xFF086CBE),
      ),
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        //
        onPageChanged: (index) {
        setState(() {
        currentPageIndex = index;
      });
    },

        children: const [
          HomePage(),
          MessagesPage(),
          NotificationsPage(),
          MenuPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected, 
        backgroundColor: Color(0xFF086CBE),
        indicatorColor: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.4),
        labelTextStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
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
            icon: Badge(label: Text('1'), child: Icon(
            Icons.mail_outline,
            color: Colors.white,)),
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