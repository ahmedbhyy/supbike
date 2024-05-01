import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapController extends GetxController {
  determinePosition();
}

class MapControllerImp extends MapController {
  double mylat = 0.0;

  double mylang = 0.0;

  Set<Marker> mymarkers = {
    Marker(
      markerId: const MarkerId("BNA Megrine"),
      position: const LatLng(36.76973250069705, 10.234363642963347),
      infoWindow: const InfoWindow(title: "BNA Megrine"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA El Mourouj"),
      position: const LatLng(36.73561704058818, 10.20955269957016),
      infoWindow: const InfoWindow(title: "BNA El Mourouj"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA Agence Moncef Bey"),
      position: const LatLng(36.79408230220227, 10.185612703770364),
      infoWindow: const InfoWindow(title: "BNA Agence Moncef Bey"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA Agence Rue Al Jazira"),
      position: const LatLng(36.79848106444125, 10.175570514323397),
      infoWindow: const InfoWindow(title: "BNA Agence Rue Al Jazira"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA - Banque Nationale Agricole"),
      position: const LatLng(36.81078251127313, 10.18381025951065),
      infoWindow: const InfoWindow(title: "BNA - Banque Nationale Agricole"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA bab Souika"),
      position: const LatLng(36.80645317713801, 10.169819858828124),
      infoWindow: const InfoWindow(title: "BNA bab Souika"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA - Le Bardo"),
      position: const LatLng(36.81091894754387, 10.138383965128432),
      infoWindow: const InfoWindow(title: "BNA - Le Bardo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("Agence Banque Nationale Agricole Menzah 9"),
      position: const LatLng(36.8445793026004, 10.155031118523599),
      infoWindow:
          const InfoWindow(title: "Agence Banque Nationale Agricole Menzah 9"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId("BNA (DenDen)"),
      position: const LatLng(36.80245197798408, 10.108379789017125),
      infoWindow: const InfoWindow(title: "BNA (DenDen)"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
  };

  Completer<GoogleMapController> googlecontroller =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(36.76973250069705, 10.234363642963347),
    zoom: 12.4746,
  );

  @override
  void onInit() {
    determinePosition();
    setInitialCameraPosition();
    super.onInit();
  }

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> setInitialCameraPosition() async {
    try {
      Position position = await determinePosition();

      kGooglePlex = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 12.4746,
      );
      mylang = position.longitude;
      mylat = position.latitude;

      update();
    } catch (e) {
      return;
    }
  }
}
