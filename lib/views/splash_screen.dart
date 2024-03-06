
import 'dart:ui';

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
    return const Scaffold(
      backgroundColor: blueColor1,
      body: Center(
        child: SpinKitThreeBounce(
          color: whiteColor,
          size: 100.0,
        ),
      ),
    );
  }
}
