import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  //final Function removeItem;
  const TripItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.id,
    //required this.removeItem,
  });
  String get seasonText {
    switch (season) {
      case Season.Winter:
        return "شتاء";
      case Season.Autumn:
        return "خريف";
      case Season.Spring:
        return "ربيع";
      case Season.Summer:
        return "صيف";
      default:
        return " غير معروف";
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return "استكشاف";
      case TripType.Recovery:
        return "نقاهه";
      case TripType.Activities:
        return "انشطة";
      case TripType.Therapy:
        return "مُعَالَجَة";
      default:
        return " غير معروف";
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailScreen.screenRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.7)
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration يوم "),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
