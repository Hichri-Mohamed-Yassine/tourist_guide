import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({super.key});

  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  /*final List<Map<String, Widget>> _screen = [
    {"Screen": CategoriesScreen(), "Title": Text("Trip categories")},
    {"Screen": FavoritesScreen(), "Title": Text("Favorite trips")}
  ];*/

  late List<Widget> _screens;

  late List<String> _titles;

  @override
  void initState() {
    _screens = [
      const CategoriesScreen(),
      FavoritesScreen(widget.favoriteTrips),
    ];
    _titles = [
      "Trip categories",
      "Favorite trips",
    ];

    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _titles[_selectedScreenIndex],
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
