import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:orderapp/repositories/geolocation/geolocation_respository.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/models.dart';
import '../../repositories/local_storage/local_storage_repository.dart';
import '../../repositories/places/places_repository.dart';
import 'package:geocoding/geocoding.dart';
import '../../repositories/repositories.dart';
import 'package:flutter/material.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final PlacesRepository _placesRepository;
  final GeolocationRepository _geolocationRepository;
  final LocalStorageRepository _localStorageRepository;
  // final RestaurantRepository _restaurantRepository;
  StreamSubscription? _placesSubscription;
  StreamSubscription? _geolocationSubscription;
  StreamSubscription? _restaurantsSubscription;

  LocationBloc({
    required PlacesRepository placesRepository,
    required GeolocationRepository geolocationRepository,
    required LocalStorageRepository localStorageRepository,
    // required RestaurantRepository restaurantRepository,
  })  : _placesRepository = placesRepository,
        _geolocationRepository = geolocationRepository,
        _localStorageRepository = localStorageRepository,
        // _restaurantRepository = restaurantRepository,
        super(LocationLoading()) {
    on<LoadMap>(_onLoadMap);
    on<SearchLocation>(_onSearchLocation);
  }

  Future<String> _onLoadName(double lat,double lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        lat, lon);
    String namePlace=placemarks.reversed.last.street.toString()+'-'+
        placemarks.reversed.last.administrativeArea.toString()+'-'+
        placemarks.reversed.last.country.toString();
    return namePlace;
  }
  void _onLoadMap(
      LoadMap event,
      Emitter<LocationState> emit,
      ) async {
    Box box = await _localStorageRepository.openBox();
    Place? place = _localStorageRepository.getPlace(box);

    if (place == null) {
      final Position position =
      await _geolocationRepository.getCurrentLocation();

      place = Place(
        name:await _onLoadName(position.latitude, position.longitude),
        lat: position.latitude,
        lon: position.longitude,
      );
    }

    // List<Restaurant> restaurants = await _getNearbyRestaurants(place);

    emit(
      LocationLoaded(
        controller: event.controller,
        place: place,
        // restaurants: restaurants,
      ),
    );
  }

  void _onSearchLocation(
      SearchLocation event,
      Emitter<LocationState> emit,
      ) async {
    final state = this.state as LocationLoaded;
    final Place place = event.place;

    Box box = await _localStorageRepository.openBox();
    _localStorageRepository.clearBox(box);
    _localStorageRepository.addPlace(box, place);

    state.controller!.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(place.lat, place.lon),
      ),
    );

    // List<Restaurant> restaurants = await _getNearbyRestaurants(place);

    emit(LocationLoaded(
      controller: state.controller,
      place: place,
      // restaurants: restaurants,
    ));
  }

  // Future<List<Restaurant>> _getNearbyRestaurants(Place place) async {
  //   List<Restaurant> restaurants =
  //   await _restaurantRepository.getRestaurants().first;
  //
  //   return restaurants
  //       .where((restaurant) =>
  //   _getRestaurantDistance(restaurant.address, place) <= 10)
  //       .toList();
  // }

  int _getRestaurantDistance(
      Place restaurantAddress,
      Place selectedAddress,
      ) {
    GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
    var distanceInKm = geolocator.distanceBetween(
      restaurantAddress.lat.toDouble(),
      restaurantAddress.lon.toDouble(),
      selectedAddress.lat.toDouble(),
      selectedAddress.lon.toDouble(),
    ) ~/
        1000;
    return distanceInKm;
  }

  @override
  Future<void> close() {
    _placesSubscription?.cancel();
    _geolocationSubscription?.cancel();
    // _restaurantsSubscription?.cancel();
    return super.close();
  }
}