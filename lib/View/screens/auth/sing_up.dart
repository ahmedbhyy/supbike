import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:supbike/View/screens/widgets/auth/textfield_auth.dart';

import '../../../Controller/auth/sign_up_controller.dart';
import '../widgets/auth/button_auth.dart';
import '../widgets/generalwidget/common_loading.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
   SignUpControllerImp singupcontroller =  Get.put(SignUpControllerImp());
    return SafeArea(
      child: Form(
        key: singupcontroller.formStatesingup,
        child: Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: GetBuilder<SignUpControllerImp>(
            builder: (controller) => ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInLeft(
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        "images/logosupbike.png",
                        height: 50.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.abrilFatface(
                      color: const Color(0xff009332),
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    "Create an account to Sup'Bike to get all features",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 30.0),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Email",
                    mycontroller: controller.email!,
                    myicon: const Icon(Icons.email_outlined),
                    ispass: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can't to be empty ";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                    mytype: TextInputType.emailAddress,
                    readonly: false,
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Username",
                    mycontroller: controller.username!,
                    myicon: const Icon(Icons.person_2_outlined),
                    ispass: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can't to be empty ";
                      }
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Password",
                    mycontroller: controller.password!,
                    myicon: const Icon(Icons.key),
                    ispass: controller.ispasswordhidden,
                    mysuffixicon: GestureDetector(
                      onTap: () {
                        controller.hidepaasword();
                      },
                      child: Icon(
                        controller.ispasswordhidden
                            ? Icons.visibility_off
                            // ignore: dead_code
                            : Icons.visibility,
                        color: const Color.fromARGB(255, 26, 105, 30),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can't to be empty ";
                      } else if (val.length < 8) {
                        return 'Weak password';
                      }
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Confirm Password",
                    mycontroller: controller.repassword!,
                    myicon: const Icon(Icons.key),
                    ispass: controller.ispasswordhidden,
                    mysuffixicon: GestureDetector(
                      onTap: () {
                        controller.hidepaasword();
                      },
                      child: Icon(
                        controller.isrepasswordhidden
                            ? Icons.visibility_off
                            // ignore: dead_code
                            : Icons.visibility,
                        color: const Color.fromARGB(255, 26, 105, 30),
                      ),
                    ),
                    validator: (val) {
                      controller.validatePassword(
                        val!,
                      );
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                const SizedBox(height: 30.0),
                controller.isloading
                    ? const CommonLoading()
                    : FadeInRight(
                        duration: const Duration(milliseconds: 900),
                        child: ButtonAuth(
                          mytitle: "Sign Up",
                          myfunction: () {
                            if (controller.formStatesingup.currentState!
                                .validate()) {
                              controller.signup(controller.email!.text,
                                  controller.password!.text, context);
                            }
                          },
                        ),
                      ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.gotosignIn(context);
                      },
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.abel(
                          color: const Color.fromARGB(255, 8, 154, 49),
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  "images/supcom.png",
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
