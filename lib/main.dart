import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';
//import 'package:traveling_app/models/catogory.dart';
//import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/categories_trips_screen.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Trip> _availableTrips = Trips_data;

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters["summer"] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters["winter"] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters["family"] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        hintColor: Colors.amber,
        useMaterial3: true,
        fontFamily: "Rubik",
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.bold),
              headlineSmall: const TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontFamily: "Rubik",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => const TabsScreen(),
        CategoriesTripsScreen.screenRoute: (ctx) =>
            CategoriesTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
