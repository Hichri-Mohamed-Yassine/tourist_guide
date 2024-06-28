import 'package:flutter/material.dart';
import 'package:traveling_app/models/catogory.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/categories_trips_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.amber,
        useMaterial3: true,
        fontFamily: "Rubik",
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
        CategoriesTripsScreen.screenRoute: (ctx) => CategoriesTripsScreen(),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
      },
    );
  }
}
