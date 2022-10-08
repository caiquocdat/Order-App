import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../blocs/autocomplete/autocomplete_bloc.dart';
import '../../blocs/blocs.dart';


import '../../models/place_model.dart';
import '../widgets/gmap.dart';
import '../widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LocationLoaded) {


              return Stack(
                children: [
                  GoogleMap(
                    myLocationEnabled: true,
                    buildingsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      context.read<LocationBloc>().add(
                        LoadMap(controller: controller),
                      );
                    },
                    // markers: markers,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        state.place.lat,
                        state.place.lon,
                      ),
                      zoom: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SvgPicture.asset('assets/logo.svg', height: 50),
                            SizedBox(width: 10),
                            Expanded(child: LocationSeachBox()),
                          ],
                        ),
                        _SearchBoxSuggestions(),
                        Spacer(),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.primary,
                            fixedSize: Size(200, 40),
                          ),
                          child: Text('Lưu'),
                          onPressed: ()   {
                            print(state.place);
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Text('Something went wrong!');
            }
          },
        ),
      )

    );
  }
}
class _SearchBoxSuggestions extends StatelessWidget {
  const _SearchBoxSuggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        print('haha +{$state}');
        if (state is AutocompleteLoading) {
          return SizedBox();
        }
        if (state is AutocompleteLoaded) {
          String address='';
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.autocomplete.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black.withOpacity(0.6),
                child: ListTile(
                  title: Text(
                    state.address,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () async{
                    double lat= state.autocomplete.last.latitude;
                    double lon=state.autocomplete.last.longitude;
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        lat, lon);
                    String namePlace=placemarks.reversed.last.street.toString()+'-'+
                        placemarks.reversed.last.administrativeArea.toString()+'-'+
                        placemarks.reversed.last.country.toString();
                    context.read<LocationBloc>().add(
                      SearchLocation(
                        place: new Place(name: namePlace,lat: state.autocomplete.last.latitude,lon: state.autocomplete.last.longitude)
                      ),
                    );
                    context.read<AutocompleteBloc>().add(ClearAutocomplete());
                  },
                ),
              );
            },
          );
        } else {
          return Text('Something went wrong!');
        }
      },
    );
  }
}
