import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for new UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'].substring(0, 26);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      //set time property
      time = now.toString();
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
