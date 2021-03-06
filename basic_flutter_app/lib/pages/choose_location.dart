import 'package:basic_flutter_app/services/WorldTime.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(url: "Europe/london", location: "London", flagPath: "uk.png"),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flagPath: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagPath: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagPath: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flagPath: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagPath: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagPath: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagPath: 'indonesia.png'),
    WorldTime(url: "Europe/Amsterdam", location: "Amsterdam", flagPath: "nl.png")
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flagpath": instance.flagPath,
      "time" :instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: ((context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
//                backgroundImage: AssetImage("assets/egypt.png"),
                  backgroundImage: AssetImage("assets/${locations[index].flagPath}"),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
