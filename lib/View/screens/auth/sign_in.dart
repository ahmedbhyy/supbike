import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supbike/Controller/auth/sign_in_controller.dart';
import 'package:supbike/View/screens/widgets/auth/textfield_auth.dart';

import '../widgets/auth/button_auth.dart';
import '../widgets/generalwidget/common_loading.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp signincontroller = Get.put(SignInControllerImp());
    return SafeArea(
      child: Form(
        key: signincontroller.formStateSignIn,
        child: Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: GetBuilder<SignInControllerImp>(
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
                const SizedBox(height: 30.0),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    "Sign In",
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
                    "Please enter your login credentials below",
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
                const SizedBox(height: 10.0),
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
                      }
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                const SizedBox(height: 10.0),
                controller.isloading2
                    ? const CommonLoading()
                    : InkWell(
                        onTap: () {
                          if (controller.email!.text == "" ||
                              controller.email!.text.isEmpty) {
                            Get.rawSnackbar(
                                title: "Error",
                                message: "Please write your email",
                                backgroundColor: Colors.red);
                          } else {
                            controller.forgetpassword(controller.email!.text);
                          }
                        },
                        child: FadeInLeft(
                          duration: const Duration(milliseconds: 800),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 1.7,
                              top: 10.0,
                            ),
                            child: const Text(
                              "Forget Password ?",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 1, 95, 75),
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 35.0),
                controller.isloading1
                    ? const CommonLoading()
                    : FadeInRight(
                        duration: const Duration(milliseconds: 900),
                        child: ButtonAuth(
                          mytitle: "Sign In",
                          myfunction: () {
                            if (controller.formStateSignIn!.currentState!
                                .validate()) {
                              controller.signin(controller.email!.text,
                                  controller.password!.text);
                            }
                          },
                        ),
                      ),
                const SizedBox(height: 25.0),
                Text(
                  "Or continue with",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abel(
                    color: const Color.fromARGB(255, 113, 120, 115),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                controller.isloading3
                    ? const CommonLoading()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            controller.signingooglefb.length,
                            (index) => InkWell(
                              onTap: () {
                                controller.signInWithGoogle(context);
                              },
                              child: Container(
                                height: 60.0,
                                width: 60.0,
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(10.0),
                                child: controller.signingooglefb[index]
                                    ["image"],
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not Registered ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.gotosignup(context);
                      },
                      child: Text(
                        "Create an account",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.abel(
                          color: const Color.fromARGB(255, 8, 154, 49),
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                        ),
                      ),
                    )
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
