


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supbike/View/screens/homescreens/events.dart';
import 'package:supbike/View/screens/homescreens/home.dart';
import 'package:supbike/View/screens/homescreens/notifications.dart';

import '../../View/screens/homescreens/profil_screen.dart';


abstract class StartController extends GetxController {
  void generatewindow(int i);
}

class StartControllerImp extends StartController {
  int selectedIndex = 0;
  late User _user;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> listpage = [
    const HomePage(),
    const BikeEvents(),
    const Notifications(),
    const ProfilScreen(),
  ];

  @override
  void onInit() {
    _user = _auth.currentUser!;
    FirebaseMessaging.instance.subscribeToTopic('supbike');
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Get.to(const Notifications());
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        Get.snackbar(
            "${message.notification!.title}", "${message.notification!.body}");
      }
    });
    gettoken();
    super.onInit();
  }

  gettoken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance.collection('users').doc(_user.uid).set(
      {
        'token': token,
      },
      SetOptions(merge: true),
    );
  }

  @override
  generatewindow(i) {
    selectedIndex = i;
    update();
  }
}
