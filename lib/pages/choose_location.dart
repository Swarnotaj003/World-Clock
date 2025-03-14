import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // List of available locations/Time zones
  List<WorldTime> worldClocks = [
    WorldTime(location: 'Kolkata, India', flag: 'India.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Dubai, UAE', flag: 'UAE.png', url: 'Asia/Dubai'),
    WorldTime(location: 'Hong Kong, China', flag: 'China.png', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Jakarta, Indonesia', flag: 'Indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Kathmandu, Nepal', flag: 'Nepal.png', url: 'Asia/Kathmandu'),
    WorldTime(location: 'Singapore', flag: 'Singapore.png', url: 'Asia/Singapore'),
    WorldTime(location: 'Tokyo, Japan', flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Harare, Zimbabwe', flag: 'Zimbabwe.png', url: 'Africa/Harare'),
    WorldTime(location: 'Johannesburg, South Africa', flag: 'SouthAfrica.png', url: 'Africa/Johannesburg'),
    WorldTime(location: 'Buenos Aires, Argentina', flag: 'Argentina.png', url: 'America/Argentina/Buenos_Aires'),
    WorldTime(location: 'Kingston, Jamaica', flag: 'Jamaica.png', url: 'America/Jamaica'),
    WorldTime(location: 'New York, USA', flag: 'USA.png', url: 'America/New_York'),
    WorldTime(location: 'Toronto, Canada', flag: 'Canada.png', url: 'America/Toronto'),
    WorldTime(location: 'Sydney, Australia', flag: 'Australia.png', url: 'Australia/Sydney'),
    WorldTime(location: 'Auckland, New Zealand', flag: 'NewZealand.png', url: 'NZ'),
    WorldTime(location: 'Rio Branco, Brazil', flag: 'Brazil.png', url: 'Brazil/Acre'),
    WorldTime(location: 'Berlin, Germany', flag: 'Germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London, UK', flag: 'UK.png', url: 'Europe/London'),
    WorldTime(location: 'Madrid, Spain', flag: 'Spain.png', url: 'Europe/Madrid'),
    WorldTime(location: 'Moscow, Russia', flag: 'Russia.png', url: 'Europe/Moscow'),
  ];

  void updateTime(index) async {
    WorldTime instance = worldClocks[index];
    await instance.getTime();
    // Navigate back to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'date' : instance.date,
      'weekDay' : instance.weekDay,
      'timeOfDay' : instance.timeOfDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Choose a location',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: worldClocks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: Card(
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    worldClocks[index].location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: SizedBox(
                    height: 45,
                    width: 60,
                    child: Image(
                      image: AssetImage('images/flags/${worldClocks[index].flag}'),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}