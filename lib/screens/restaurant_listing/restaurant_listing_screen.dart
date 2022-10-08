import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant-listing';

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
        builder: (_) => RestaurantListingScreen(restaurants: restaurants),
        settings: RouteSettings(name: routeName));
  }

  final List<Restaurant> restaurants;


  const RestaurantListingScreen({
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách các nhà hàng ',style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: restaurants[index]);
            },
          ),
        ),
      ),
    );
  }
}
