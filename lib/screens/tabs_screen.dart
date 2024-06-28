import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  /*final List<Map<String, Widget>> _screen = [
    {"Screen": CategoriesScreen(), "Title": Text("Trip categories")},
    {"Screen": FavoritesScreen(), "Title": Text("Favorite trips")}
  ];*/

  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  final List<String> _titles = [
    "Trip categories",
    "Favorite trips",
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _titles[_selectedScreenIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "favorites list",
          ),
        ],
      ),
    );
  }
}
