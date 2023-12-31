import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for new UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoint
  late bool isDaytime; //true if day, false if night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
          //debugPrint('$response');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'].substring(0, 26);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      //set time property
      isDaytime = now.hour >= 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
