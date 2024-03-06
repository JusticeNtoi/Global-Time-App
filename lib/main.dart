import 'package:flutter/material.dart';
import 'package:global_time/views/colors.dart';
import 'package:global_time/views/home.dart';
import 'package:global_time/views/location_screen.dart';
import 'package:global_time/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor1),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/location': (context) => const LocationScreen(),
      },
    );
  }
}

