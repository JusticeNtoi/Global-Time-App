
import 'package:flutter/material.dart';
import 'package:global_time/views/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String backgroundImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color topColor = data['isDayTime'] ? blueColor2 : brownColor;

    return Scaffold(
      backgroundColor: topColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$backgroundImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(
              children: [

                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                       'time': result['time'],
                       'location': result['location'],
                       'isDayTime': result['isDayTime'],
                       'flag': result['flag'],
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: whiteColor,
                  ),
                  label: const Text(
                    'Change Location',
                    style: TextStyle(color: whiteColor),
                  ),
                ),

                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),

                20.heightBox,
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: blackColor,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 4),
                        blurRadius: 6,
                        color: blackColor.withOpacity(0.2),
                      ),
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
