import 'package:basic_flutter_app/pages/choose_location.dart';
import 'package:basic_flutter_app/pages/home.dart';
import 'package:basic_flutter_app/pages/Loading.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
//    home: Home(),
//    initialRoute: "/home",
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (contect) => ChooseLocation()
    },
  ));
}

