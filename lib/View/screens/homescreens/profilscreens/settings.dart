import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../Controller/home_controllers/setting_controller.dart';
import '../../../Slides/slide_right.dart';
import '../../widgets/generalwidget/appbar_common.dart';
import '../../widgets/generalwidget/common_containersettings.dart';
import '../../widgets/generalwidget/container_settings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerProfilImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          children: [
            const AppBarCommon(title: "Settings"),
            const SizedBox(height: 20.0),
            Image.asset(
              "images/settings.png",
              filterQuality: FilterQuality.high,
              height: 200.0,
            ),
            GetBuilder<SettingsControllerProfilImp>(
              builder: (controller) => CommonContainerSettings(
                mywidget: Column(
                  children: [
                    ContainerSettings(
                      mywidget: Switch(
                        value: controller.notification,
                        onChanged: (bool value) {
                          controller.updateswitcher(value);
                        },
                      ),
                      myicon: controller.notification
                          ? const Icon(Icons.notifications_active_outlined)
                          : const Icon(Icons.notifications_none_outlined),
                      mytext: "Notifications",
                    ),
                    ...List.generate(
                      controller.settingsprofil.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            SlideRight(
                              page: controller.mywidgets[index],
                            ),
                          );
                        },
                        child: ContainerSettings(
                          mywidget: Lottie.asset(
                            "images/lotties/lottie_arrow.json",
                            height: 40.0,
                          ),
                          mytext: controller.settingsprofil[index],
                          myicon: controller.myicons[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
