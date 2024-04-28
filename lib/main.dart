import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supbike/View/screens/auth/sign_in.dart';
import 'package:supbike/View/screens/auth/sing_up.dart';
import 'package:supbike/firebase_options.dart';
import 'package:supbike/start.dart';

import 'View/screens/chooselang.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SupBike());
}

class SupBike extends StatelessWidget {
  const SupBike({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sup'Bike",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const StartScreen()
          : const ChooseLang(),
      //home: const ChooseLang(),
      getPages: [
        GetPage(name: "/signin", page: () => const SignIn()),
        GetPage(name: "/singup", page: () => const SignUp()),
        GetPage(name: "/start", page: () => const StartScreen()),
      ],
    );
  }
}
