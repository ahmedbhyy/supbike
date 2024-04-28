import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BikeEvents extends StatelessWidget {
  const BikeEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Events",
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
            Lottie.asset(
              "images/lotties/lottie_bikevent.json",
              height: 200,
            ),
            ...List.generate(
              10,
              (index) => Card(
                color: Colors.white,
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    "Event ${index + 1} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 20, 103, 23),
                    ),
                  ),
                  subtitle: const Text("descprtion"),
                  trailing: Image.asset(
                    "images/bikeevent.png",
                  ),
                  leading: const Icon(
                    Icons.pedal_bike,
                    color: Color.fromARGB(255, 20, 103, 23),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
