import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';

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
      home: CategoriesScreen(),
    );
  }
}
