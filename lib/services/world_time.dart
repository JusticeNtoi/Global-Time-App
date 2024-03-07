import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name on the User Interface
  String flag; // url to the asset flag icon
  String url; // location url for the api endpoint
  String? time; // the time of that location
  bool? isDayTime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {

    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      // Get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // Create DateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the Time
      isDayTime = now.hour > 5 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get Time data!';
    }
  }

}