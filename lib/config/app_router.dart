import 'package:flutter/material.dart';
import 'package:orderapp/models/models.dart';
import 'package:orderapp/screens/basket/basket_screen.dart';
import 'package:orderapp/screens/checkout/checkout_screen.dart';
import 'package:orderapp/screens/delivery_time/delivery_time_screen.dart';
import 'package:orderapp/screens/filter/filter_screen.dart';
import 'package:orderapp/screens/home/home_screen.dart';
import 'package:orderapp/screens/location/location_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:orderapp/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:orderapp/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:orderapp/screens/voucher/voucher_screen.dart';

import '../screens/edit_basket/edit_basket_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The router is: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>,
            );
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
