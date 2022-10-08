import 'package:geolocator/geolocator.dart';

abstract class BaseGeolocationRespository{
  Future<Position?> getCurrentLocation() async{

  }
}