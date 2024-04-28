import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:supbike/Controller/home_controllers/profil_controller.dart';

import '../widgets/generalwidget/container_forprofil.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfilControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<ProfilControllerImp>(
          builder: (controller) => ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Profil",
                    style: GoogleFonts.abrilFatface(
                      color: const Color(0xff009332),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  Image.asset(
                    "images/logosupbike.png",
                    height: 40.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: MediaQuery.of(context).size.width / 4.0),
                child: const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.freepik.com/512/3001/3001764.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              ...List.generate(
                controller.categoriesprofil.length,
                (index) => ContainerListTile(
                  mypage: controller.categoriespages[index],
                  title: controller.categoriesprofil[index],
                  mysubtitle: controller.categoriesprofildescription[index],
                  myimage: "images/bike.png",
                ),
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  controller.logout();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "images/lotties/lottie_logout.json",
                      height: 50.0,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Log Out',
                          textStyle: GoogleFonts.mulish(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 1, 100, 78),
                          ),
                          colors: [
                            const Color.fromARGB(255, 42, 90, 43),
                            Colors.blue
                          ],
                        ),
                      ],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 100,
                      pause: const Duration(milliseconds: 50),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
