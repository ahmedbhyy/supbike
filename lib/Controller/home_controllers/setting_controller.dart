
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../View/screens/homescreens/profilscreens/settingsscreens/changepass.dart';
import '../../View/screens/homescreens/profilscreens/settingsscreens/language.dart';
import '../../View/screens/homescreens/profilscreens/settingsscreens/privacy.dart';
import '../../View/screens/homescreens/profilscreens/settingsscreens/report.dart';

abstract class SettingsControllerProfil extends GetxController {
  updateswitcher(bool switcher);
}

class SettingsControllerProfilImp extends SettingsControllerProfil {
  bool notification = true;

  List<String> settingsprofil = [
    "Change Password",
    "Language",
    "Privacy",
    "Report",
   
  ];

  List<Icon> myicons = [
    const Icon(Icons.key_rounded),
    const Icon(Icons.language),
    const Icon(Icons.privacy_tip_outlined),
    const Icon(Icons.report),

  ];

  List<Widget> mywidgets = [
    const ChangePassword(),
    const Language(),
    const Privacy(),
    const HelpSettings(),
   
  ];

  @override
  updateswitcher(switcher) {
    notification = switcher;
    update();
  }
}
