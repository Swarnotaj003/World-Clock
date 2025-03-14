import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    // Fetch data from Navigator
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/skies/${data['timeOfDay']}.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 20),
                SizedBox(
                  height: 100,
                  child: Image(
                    image: AssetImage('images/flags/${data['flag']}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
        
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),  
          
            CircleAvatar(
              minRadius: 150,
              backgroundColor: Colors.black26,
              child: Column(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                    size: 84,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Digital',
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
        
            Container(
              color: Colors.black26,
              padding : EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['weekDay'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data['date'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
        
            Expanded(
              flex: 3,
              child: SizedBox(),
            ),
        
            ElevatedButton(
              onPressed: () async {
                // Fetch updated data after switching location
                dynamic result = await Navigator.pushNamed(
                  context,
                  '/location',
                );
                setState(() {
                  data = {
                    'location': result['location'],
                    'flag': result['flag'],
                    'time': result['time'],
                    'date': result['date'],
                    'weekDay': result['weekDay'],
                    'timeOfDay': result['timeOfDay'],
                  };
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                shadowColor: WidgetStateProperty.all(Colors.grey),
                elevation: WidgetStateProperty.all(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_location_alt,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Edit location',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}