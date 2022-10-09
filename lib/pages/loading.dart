import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitPouringHourGlass(
          color: Colors.white,
          size:150.0,
        )
      ),
    );
  }
void setupWorldTime() async{
    WorldTime instance =  WorldTime(location: 'Damascus', flag: 'sy.png', url: 'Asia/Damascus');
    await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime,
  });
}

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
}
