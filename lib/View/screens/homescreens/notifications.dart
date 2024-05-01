import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Row(
          children: [
            Text("Clear all"),
            SizedBox(width: 5.0),
            Icon(Icons.delete_outline_rounded)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.green,
                  )),
              Text(
                "Notifications",
                style: GoogleFonts.abrilFatface(
                  color: const Color(0xff009332),
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const Spacer(),
              Image.asset(
                "images/logosupbike.png",
                height: 40.0,
              ),
            ],
          ),
          Image.asset(
            "images/notifications.png",
            height: 200.0,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 400.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: Color.fromARGB(255, 239, 219, 219),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      "Notification ${index + 1} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 20, 103, 23),
                      ),
                    ),
                    subtitle: const Text("descprtion"),
                    trailing: Image.asset(
                      "images/notifications1.png",
                      height: 40.0,
                    ),
                    leading: const Icon(
                      Icons.pedal_bike,
                      color: Color.fromARGB(255, 20, 103, 23),
                    ),
                  ),
                ),
              ),
              const Positioned(
                right: 5.0,
                top: -15,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 178, 246, 180),
                  radius: 15.0,
                  child: Text("5"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
