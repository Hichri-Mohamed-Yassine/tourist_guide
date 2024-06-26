import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';

class CategoriesTripsScreen extends StatelessWidget {
  static const String screenRoute = "/category-trips";
  /*final String categoryId;
  final String categoryTitle;

  const CategoriesTripsScreen(
      {super.key, required this.categoryId, required this.categoryTitle});
  */
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument["id"];
    final categoryTitle = routeArgument["title"];
    final filterdTrips = Trips_data.where(
      (trip) => trip.categories.contains(categoryId),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(filterdTrips[index].title);
        },
        itemCount: filterdTrips.length,
      ),
    );
  }
}
