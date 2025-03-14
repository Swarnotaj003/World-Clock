import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;          // location for the UI
  String flag;              // url to an asset flag
  String url;               // location url for api endpoint, e.g.'Asia/Calcutta'
  String time = "";         // store current time in that location
  String date = "";         // store current date in that location
  String weekDay = "";      // store current weekday in that location
  String timeOfDay = "";  // store time of the day

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make API request
      Response response = await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map map = jsonDecode(response.body);
      String dateTime = map['dateTime'];
      String dayOfWeek = map['dayOfWeek'];

      // Set time, date, weekday & dayTime
      DateTime now = DateTime.parse(dateTime);
      time = DateFormat('HH:mm').format(now);

      String day = DateFormat('dd').format(now);
      String month = DateFormat('MMMM').format(now);
      String year = DateFormat('yyyy').format(now);
      date = "$day $month $year";

      weekDay = dayOfWeek;
      timeOfDay = (now.hour >= 5 && now.hour < 12) ? 'morning' :
        (now.hour >= 12 && now.hour < 17) ? 'afternoon' :
        (now.hour >= 17 && now.hour < 21) ? 'evening' :
        'night';
    } 
    catch (e) {
      print("## CAUGHT ERROR ##\n $e");
      time = 'ERROR in fetching time!';
      date = '01 ERRary 1999';
      weekDay = 'ERRORday';
      timeOfDay = 'night';
    }
  }
}