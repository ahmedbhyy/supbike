
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supbike/View/screens/homescreens/profilscreens/about_us.dart';
import 'package:supbike/View/screens/homescreens/profilscreens/settings.dart';

import '../../View/screens/homescreens/profilscreens/edit_profil.dart';

abstract class ProfilController extends GetxController {
  logout();
}

class ProfilControllerImp extends ProfilController {
  String imageFile = "https://cdn-icons-png.freepik.com/512/3001/3001764.png";
  ProfilControllerImp() {
    categoriespages = [
      const EditProfil(),
      const Settings(),
     const AboutUs()
    ];
  }
  List<String> categoriesprofil = [
    "Edit Profil",
    "Settings",
    "About us",

  ];
  List<String> categoriesprofilimages = [
    "editprofil",
    "settings",
    "logosupbike",

  ];
  List<String> categoriesprofildescription = [
    "edit your profil",
    "change settings",
    "about our club",

  ];
  List<Widget> categoriespages = [];

  @override
  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed("/signin");
    } catch (e) {
      return;
    }
  }
}
