import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import '../../models/place_autocomplete_model.dart';
import '../../models/place_model.dart';
import '../../repositories/places/places_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading()) {
    on<LoadAutocomplete>(_onLoadAutocomplete);
    on<ClearAutocomplete>(_onClearAutocomplete);
  }

  void _onLoadAutocomplete(
      LoadAutocomplete event,
      Emitter<AutocompleteState> emit,
      ) async {
    List<Location> locations=await locationFromAddress(event.searchInput);
    double lat=locations.last.latitude;
    double long=locations.last.longitude;
    final List<Location> autocomplete =
    await locationFromAddress(event.searchInput);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        lat, long);
    String address='${placemarks.reversed.last.street.toString()},${ placemarks.reversed.last.administrativeArea.toString()},${placemarks.reversed.last.country.toString()}';
    emit(AutocompleteLoaded(autocomplete: autocomplete,address: address));
  }

  void _onClearAutocomplete(
      ClearAutocomplete event,
      Emitter<AutocompleteState> emit,
      ) async {
    emit(AutocompleteLoaded(autocomplete: List.empty(),address: ''));
  }

  @override
  Future<void> close() async {
    _placesSubscription?.cancel();
    super.close();
  }
}
