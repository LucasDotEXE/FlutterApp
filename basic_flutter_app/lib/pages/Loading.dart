import 'package:flutter/material.dart';
import 'package:basic_flutter_app/services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupWorldTime() async {
  WorldTime instance = WorldTime(location: "Berlin", flagPath: "germany.png", url: "Europe/Berlin");
  await instance.getTime();
  Navigator.pushReplacementNamed(context, "/home", arguments: {
    "location": instance.location,
    "flagpath": instance.flagPath,
    "time" :instance.time,
    "isDayTime": instance.isDayTime
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
      backgroundColor: Colors.blue[900],
      body: Center (
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80,
        ),
      )
    );
  }
}
