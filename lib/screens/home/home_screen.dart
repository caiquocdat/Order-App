import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/location/location_bloc.dart';
import '../../models/category_model.dart';
import '../../models/promo_model.dart';
import '../../models/restaurant_model.dart';
import '../location/location_screen.dart';
import '../widgets/category_box.dart';
import '../widgets/food_search_box.dart';
import '../widgets/promo_box.dart';
import '../widgets/restaurant_card.dart';
import 'package:geocoding/geocoding.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(category: Category.categories[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promo: Promo.promos[index]);
                  },
                ),
              ),
            ),
            FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Quán Gần Bạn',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoading) {
                    // _getPlace();
                    return Center(child: CircularProgressIndicator());
                  } else if (state is LocationLoaded) {
                    String city = state.place.name;
                    if (city.toUpperCase().contains('Gia Lai'.toUpperCase())) {
                      return ListView.builder(
                        itemCount: Restaurant.restaurants.length,
                        itemBuilder: (context, index) {
                          return RestaurantCard(
                            restaurant: Restaurant.restaurants[index],
                          );
                        },
                      );
                    }
                  }
                  return Center(
                    child: Text(
                      'Không có quán nào ở tỉnh thành của bạn',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  );

                  // return ListView.builder(
                  //   itemCount: Restaurant.restaurants.length,
                  //   itemBuilder: (context, index) {
                  //     return RestaurantCard(
                  //       restaurant: Restaurant.restaurants[index],
                  //     );
                  //   },
                  // );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String? city = '';

  CustomAppBar({
    this.city,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {},
      ),
      centerTitle: false,
      title: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          // String place;
          if (state is LocationLoading) {
            // _getPlace();
            return Center(child: CircularProgressIndicator());
          }
          if (state is LocationLoaded) {
            // double lat=state.place.lat;
            // double lon=state.place.lon;
            // _getPlace(lat, lon);

            return InkWell(
              onTap: () async {
                // 15.1058687,107.3229445
                double latt = 13.7100718;
                double longg = 108.0659491;
                List<Placemark> placemarks = await placemarkFromCoordinates(
                    state.place.lat, state.place.lon);
                // String name = placemarks.reversed.last.name.toString();
                // String subLocality = placemarks.reversed.last.subLocality.toString();
                // String locality = placemarks.reversed.last.locality.toString();
                // String administrativeArea = placemarks.reversed.last.administrativeArea.toString();
                // String postalCode = placemarks.reversed.last.postalCode.toString();
                // String country = placemarks.reversed.last.country.toString();
                //
                city = placemarks.reversed.last.country.toString();
                // String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
                // place=placemarks.reversed.last.street.toString()+'-'+
                //     placemarks.reversed.last.administrativeArea.toString()+'-'+
                //     placemarks.reversed.last.country.toString();
                print(placemarks.reversed.last.street.toString() +
                    '-' +
                    placemarks.reversed.last.administrativeArea.toString() +
                    '-' +
                    placemarks.reversed.last.country.toString());

                // print(address);
                Navigator.pushNamed(context, LocationScreen.routeName);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vị trí hiện tại',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    // place,//02 Thanh Sơn,Thanh Bình,Hải Châu,Đà Nẵng ${state.place.lon}
                    '${state.place.name}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            );
          } else {
            return Text('Something went wrong.');
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

void _getPlace() async {
  //13.7204783, 108.0634383
  double lat = 13.7204783;
  double long = 108.0634383;
  String _address = ""; // create this variable
  List<Placemark> placeMarks;
  try {
    placeMarks = await placemarkFromCoordinates(lat, long);
    Placemark placeMark = placeMarks[0];
    String address = placeMark.toString();
    print(address + 'abc');
  } catch (e) {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      placeMarks = await placemarkFromCoordinates(lat, long);
    } catch (e) {}
  }

  // this is all you need
}
