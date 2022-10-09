import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url:'Asia/Damascus',location: 'Damascus',flag: 'sy.png'),
    WorldTime(url:'Asia/Baghdad',location: 'Baghdad',flag: 'iraq.png'),
    WorldTime(url:'Asia/Beirut',location: 'Beirut',flag: 'Leb.png'),
    WorldTime(url:'Africa/Cairo',location: 'Cairo',flag: 'Egypt.png'),
    WorldTime(url:'Asia/Dubai',location: 'Dubai',flag: 'UAE.png'),
    WorldTime(url:'Asia/Tehran',location: 'Tehran',flag: 'ir.png'),
    WorldTime(url:'Europe/Berlin',location: 'Berlin',flag: 'Germ.png'),
    WorldTime(url:'America/Toronto',location: 'Toronto',flag: 'canada.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child:Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title:Text(locations[index].location.toString()),
                leading:CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
}
