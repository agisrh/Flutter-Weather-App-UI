import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/models/location_model.dart';

class LocationService {
  final StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>();
  Stream<UserLocation> get locationStream => _locationStreamController.stream;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late LocationPermission permission;
  bool serviceEnabled = false;

  LocationService() {
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 10,
    )).listen((Position position) async {
      serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
      if (serviceEnabled) {
        _locationStreamController.add(
          UserLocation(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        );
      }
    });
  }

  void dispose() => _locationStreamController.close();
}
