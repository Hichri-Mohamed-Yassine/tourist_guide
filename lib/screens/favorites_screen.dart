import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({super.key});

  final List<Trip> favoriteTrips;
  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text("You do not have any trip in your favorites list"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            id: favoriteTrips[index].id,
            //removeItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
