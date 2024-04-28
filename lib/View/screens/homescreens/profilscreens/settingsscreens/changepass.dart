
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supbike/View/screens/widgets/generalwidget/common_containersettings.dart';

import '../../../../../Controller/home_controllers/settingsscreen/changepass_controller.dart';
import '../../../widgets/auth/button_auth.dart';
import '../../../widgets/generalwidget/appbar_common.dart';
import '../../../widgets/generalwidget/common_loading.dart';



class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePassControllerImp());
    return GetBuilder<ChangePassControllerImp>(
      builder: (controller) => Form(
        key: controller.formStatechangepassword,
        child: Scaffold(
           backgroundColor: Colors.white,
          body:SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                children: [
                  const AppBarCommon(title: "Change Password"),
                  Image.asset(
                    "images/editprofil.png",
                    filterQuality: FilterQuality.high,
                    height: 200.0,
                  ),
                  CommonContainerSettings(
                    mywidget: Column(
                      children: [
                        const Text(
                          "To ensure the security of your account We'll send you an email with instructions on how to reset your password. Your safety and privacy are our top priorities, and this additional verification step helps us protect your account from unauthorized access. Thank you for your cooperation in maintaining the security of your personal information.",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 130, 121, 121),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30.0),
                        controller.isloading
                            ? const CommonLoading()
                            : ButtonAuth(
                                mytitle: "Send",
                                myfunction: () {
                                  if (controller
                                      .formStatechangepassword.currentState!
                                      .validate()) {
                                    controller.sendemail();
                                  }
                                },
                              ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    
    );
  }
}
