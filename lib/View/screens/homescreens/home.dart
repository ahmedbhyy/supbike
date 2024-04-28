import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supbike/Controller/home_controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22.0,
                        backgroundImage: NetworkImage(
                            "https://cdn-icons-png.freepik.com/512/3001/3001764.png"),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back",
                          ),
                          const SizedBox(height: 3.0),
                          AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                "Member",
                                textStyle: GoogleFonts.mulish(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 1, 100, 78),
                                ),
                                colors: controller.colorizeColors,
                              ),
                            ],
                            isRepeatingAnimation: true,
                            totalRepeatCount: 100,
                            pause: const Duration(milliseconds: 50),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    "images/logosupbike.png",
                    height: 40.0,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 250.0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        key: UniqueKey(),
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "images/${controller.eventimages[controller.currentindex]}.jpg",
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.width / 2.1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 5.1,
                        right: MediaQuery.of(context).size.width / 2.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              controller.eventimages.length,
                              (index) => AnimatedContainer(
                                margin: const EdgeInsets.only(right: 5.0),
                                duration: const Duration(milliseconds: 900),
                                width:
                                    controller.currentindex == index ? 20 : 5,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 32, 153, 79),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: -25,
                        child: Image.asset(
                          "images/bike.png",
                          height: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bikes",
                    style: GoogleFonts.abrilFatface(
                      color: const Color(0xff009332),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              GridView.builder(
                shrinkWrap: true,
                itemCount: controller.bikes.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10.0),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(
                          controller.bikes[index]["bikeimage"],
                          height: 100.0,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.bikes[index]["bikename"],
                              style: const TextStyle(fontSize: 13.0),
                            ),
                            const Icon(
                              Icons.arrow_circle_right_sharp,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
