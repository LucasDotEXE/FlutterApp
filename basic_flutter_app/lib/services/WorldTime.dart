import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flagPath;
  String url;

  WorldTime({ this.location, this.flagPath, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data["datetime"];
      String offset = data["utc_offset"];
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset.substring(1, 3)), ));
      //print(now);

      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught error: $e");
      time = "could'nt get time";
    }
  }

}