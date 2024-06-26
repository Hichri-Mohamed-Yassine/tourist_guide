import 'package:flutter/material.dart';

class CategoriesTripsScreen extends StatelessWidget {
  const CategoriesTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trips page"),
      ),
      body: const Center(
        child: Text("List of trips of this category"),
      ),
    );
  }
}
