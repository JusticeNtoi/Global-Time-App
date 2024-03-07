
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:global_time/services/world_time.dart';
import 'package:global_time/views/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Maseru', flag: '', url: 'Africa/Maseru',);
    await worldTime.getTime();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor1,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/worldtime.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: whiteColor.withOpacity(0.9),
                  width: 2.5,
                ),
              ),
              child: Text(
                "WORLD TIME",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                  shadows: [
                    Shadow(
                      offset: const Offset(2, 4),
                      blurRadius: 6,
                      color: blackColor.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ),
            20.heightBox,
            const Center(
              child: SpinKitCircle(
                color: whiteColor,
                size: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
