import 'package:flutter/material.dart';
import 'package:drawer_app/componenets/drawer.dart';
import 'package:drawer_app/componenets/navbar.dart';
import 'package:drawer_app/pages/homePage.dart';
import 'package:drawer_app/pages/messagesPage.dart';
import 'package:drawer_app/pages/notifsPage.dart';
import 'package:drawer_app/pages/menu.dart';
import 'package:drawer_app/pages/settings.dart';
import 'package:drawer_app/pages/userProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _setDarkMode(bool enabled) {
    setState(() {
      _themeMode = enabled ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlueAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF086CBE),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF172A3A),
        ),
      ),
      themeMode: _themeMode,
      routes: {
        '/profile': (context) => const Profile(),
        '/settings': (context) => Settings(
              isDarkMode: _themeMode == ThemeMode.dark,
              onDarkModeChanged: _setDarkMode,
            ),
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      appBar: AppBar(
        title: const Text(
          'Drawer & NavBar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
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
      bottomNavigationBar: AppNavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
      drawer: const AppDrawer(),
    );
  }
}
