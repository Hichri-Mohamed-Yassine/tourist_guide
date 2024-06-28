import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
//import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class CategoriesTripsScreen extends StatelessWidget {
  static const String screenRoute = "/category-trips";

  const CategoriesTripsScreen({super.key});
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
    final filteredTrips = Trips_data.where(
      (trip) => trip.categories.contains(categoryId),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            tripType: filteredTrips[index].tripType,
            season: filteredTrips[index].season,
            id: filteredTrips[index].id,
          );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
