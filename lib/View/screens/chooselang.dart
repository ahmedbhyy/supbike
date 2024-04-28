import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'widgets/onboardingwidget/buttonchooselang.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          children: [
            Lottie.asset("images/lotties/lottie_lang.json"),
            const SizedBox(height: 30.0),
            Text(
              "Choose a Language",
              textAlign: TextAlign.center,
              style: GoogleFonts.aladin(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 124, 124, 102),
              ),
            ),
            const SizedBox(height: 30.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonChooseLang(
                  mycolor: Color.fromARGB(255, 11, 235, 4),
                  namelang: "Frensh",
                  mycolortext: Color.fromARGB(255, 42, 87, 5),
                ),
                SizedBox(width: 30.0),
                ButtonChooseLang(
                  mycolor: Color.fromARGB(255, 127, 140, 5),
                  mycolortext: Color.fromARGB(255, 255, 255, 255),
                  namelang: "English",
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Image.asset(
              "images/logosupbike.png",
              height: 120.0,
            )
          ],
        ),
      ),
    );
  }
}
