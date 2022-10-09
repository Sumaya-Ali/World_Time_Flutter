import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDayTime;

  WorldTime({this.location,this.flag,this.url});

  //https://jsonplaceholder.typicode.com/
 Future<void> getTime() async {
   try {
     //Asia/Damascus
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1, 3);
     String offsetMinute = data['utc_offset'].substring(4,6);
     String operation = data['utc_offset'].substring(0,1);
     DateTime now = DateTime.parse(datetime);
     if(operation == '+'){
       now = now.add(Duration(hours: int.parse(offset),minutes: int.parse(offsetMinute)));
     }else{
       now = now.subtract(Duration(hours: int.parse(offset),minutes: int.parse(offsetMinute)));
     }

     isDayTime = now.hour > 6  && now.hour < 20 ? true: false;
     time = DateFormat.jm().format(now);
   }
   catch(e){
     print('caught error: $e');
     time='could not get time data';
   }
 }
}