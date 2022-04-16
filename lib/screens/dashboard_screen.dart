import 'package:flutter/material.dart';
import 'package:movie_app/screens/category/category_screen.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/settings/setting_screen.dart';
import 'package:movie_app/utils/strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  List<Widget> items = const [
    HomeScreen(),
    CategoryScreen(),
    SettingScreen(),
  ];
  void _selectedItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appName,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: items.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.grey,
        // backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Strings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: Strings.category,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: Strings.settings,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _selectedItem,
        // selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
