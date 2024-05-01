import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:supbike/Controller/home_controllers/map_controller.dart';

class MyMap extends StatelessWidget {
  const MyMap({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MapControllerImp());
    return Scaffold(
      body: GetBuilder<MapControllerImp>(
        builder: (mycontroller) => 
         GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          markers: mycontroller.mymarkers,
          initialCameraPosition: mycontroller.kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            if (!mycontroller.googlecontroller.isCompleted) {
              mycontroller.googlecontroller.complete(controller);
            }
          },
        ),
      ),
    );
  }
}
