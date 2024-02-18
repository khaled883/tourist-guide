// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:tarveling_app/app_data.dart';
import 'package:tarveling_app/models/trip.dart';
import 'package:tarveling_app/widgets/trip_item.dart';
//import '/app_data.dart'; //This import is not used anymore.

class CategoryTripsScreen extends StatefulWidget {
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;
  CategoryTripsScreen(this.availableTrips);
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String? categoryTitle;
  late List<Trip> displayTrips;
  //@override
  // void initState() {
  //   //this is the initState method
  //   //the initState is not gonna work with the context because the context is not reloaded yet
  //   //and the initState works very early,...so insteade we used the didChangeDependencies

  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    //we are using that method instead of the initState
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    displayTrips = widget.availableTrips.where((trip) {
      //displayTrips =widget.availableTrips.where....
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    //Arb3 far5at w dgaga w m7d4 fahm 7aga

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          categoryTitle!,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            //removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
      backgroundColor: Colors.white,//edit
    );
  }
}
