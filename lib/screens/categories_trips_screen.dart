import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class CategoriesTripsScreen extends StatefulWidget {
  static const String screenRoute = "/category-trips";

  final List<Trip> availableTrips;
  CategoriesTripsScreen(this.availableTrips);

  @override
  State<CategoriesTripsScreen> createState() => _CategoriesTripsScreenState();
}

class _CategoriesTripsScreenState extends State<CategoriesTripsScreen> {
  String? categoryTitle;
  List<Trip> dispalyTrips = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument["id"];
    categoryTitle = routeArgument["title"];
    dispalyTrips = widget.availableTrips
        .where(
          (trip) => trip.categories.contains(categoryId),
        )
        .toList();
  }

  void _removeTrip(String tripId) {
    setState(() {
      dispalyTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  /*final String categoryId;
  final String categoryTitle;

  const CategoriesTripsScreen(
      {super.key, required this.categoryId, required this.categoryTitle});
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: dispalyTrips[index].title,
            imageUrl: dispalyTrips[index].imageUrl,
            duration: dispalyTrips[index].duration,
            tripType: dispalyTrips[index].tripType,
            season: dispalyTrips[index].season,
            id: dispalyTrips[index].id,
            //removeItem: _removeTrip,
          );
        },
        itemCount: dispalyTrips.length,
      ),
    );
  }
}
