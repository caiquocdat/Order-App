import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/filter/filter_bloc.dart';
import '../../models/Price_model.dart';
import '../../models/category_model.dart';
import '../../models/restaurant_model.dart';
import '../widgets/custom_category_filter.dart';
import '../widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filters';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Lọc', style: Theme.of(context).textTheme.headline3),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state is FilterLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FilterLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(),
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text('Tìm kiếm'),
                    onPressed: () {
                      var catelories = state.filter.categoryFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.category.name)
                          .toList();

                      var prices = state.filter.priceFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.price.price)
                          .toList();

                      List<Restaurant> restaurants = Restaurant.restaurants
                          .where((restaurant) => catelories.any(
                              (category) => restaurant.tags.contains(category)))
                          .where((restaurant) => prices.any(
                              (price) => restaurant.priceCategory.contains(price)))
                          .toList();
                      Navigator.pushNamed(
                        context,
                        '/restaurant-listing',
                        arguments: restaurants,
                      );
                    },
                  );
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
          ],
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Giá',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            CustomPriceFilter(),
            Text(
              'Danh mục',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
