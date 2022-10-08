part of 'location_bloc.dart';



abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LoadMap extends LocationEvent {
  final GoogleMapController? controller;

  const LoadMap({this.controller});

  @override
  List<Object?> get props => [controller];
}

class SearchLocation extends LocationEvent {
  final Place place ;

  const SearchLocation({required this.place});

  @override
  List<Object?> get props => [place];
}