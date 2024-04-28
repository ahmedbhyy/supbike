import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/onboardingcontrollers/onboarding_controller.dart';
import '../../../../Model/data/staticdata/onboardinglist.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5.0),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage == index ? 20 : 5,
              height: 8,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 6, 223, 10),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
