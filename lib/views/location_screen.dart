
import 'package:flutter/material.dart';
import 'package:global_time/services/world_time.dart';
import 'package:global_time/views/colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Maseru', location: 'Maseru', flag: 'lesotho.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    // Navigate back to home Screen
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {

    // String appBarColor = data['isDayTime'] ? blueColor1 : brownColor;
    // Color backgroundColor = data['isDayTime'] ? blueColor2 : brownColor2);
    
    return Scaffold(
      backgroundColor: blueColor3,
      appBar: AppBar(
        foregroundColor: whiteColor,
        backgroundColor: blueColor1,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0,),
            child: Card(
              color: whiteColor,
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/${locations[index].flag}'),
                  radius: 24,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
