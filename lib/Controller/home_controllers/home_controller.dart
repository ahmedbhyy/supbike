import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  List<Color> colorizeColors = [
    Colors.green,
    const Color.fromARGB(255, 65, 102, 66),
    Colors.yellow,
    Colors.red,
  ];

  List<Map> bikes = [
    {
      "bikename": "Rockrider ST 100",
      "bikeimage":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEDnUIiLZJkRMqfV3VLf-1cEz7NAv-awgjcn6JnfYpsw&s"
    },
    {
      "bikename": "Rockrider GT 100",
      "bikeimage":
          "https://www.statebicycle.com/cdn/shop/products/6061-eBikeCommuter-MatteBlack_1.jpg?v=1684443969"
    },
    {
      "bikename": "Rockrider ST 100",
      "bikeimage":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEDnUIiLZJkRMqfV3VLf-1cEz7NAv-awgjcn6JnfYpsw&s"
    },
    {
      "bikename": "Rockrider GT 100",
      "bikeimage":
          "https://www.statebicycle.com/cdn/shop/products/6061-eBikeCommuter-MatteBlack_1.jpg?v=1684443969"
    },
  ];
  List<String> eventimages = ["event2", "event1", "event3", "event4", "event5"];

  int currentindex = 0;
  late Timer timer;
  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      currentindex = (currentindex + 1) % eventimages.length;
      update();
    });
    super.onInit();
  }
}
