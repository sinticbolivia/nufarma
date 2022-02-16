import 'package:flutter/material.dart';
import '../../classes/alarm.dart';
import '../../colors.dart' as colors;

class AlarmItem extends StatefulWidget
{
  final Alarm alarm;
  AlarmItem({this.alarm});

  @override
  _AlarmItemState createState() => _AlarmItemState();
}
class _AlarmItemState extends State<AlarmItem>
{
  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              color: colors.mainColors['secondary'],
              width: 35,
              height: 35,
              child: Icon(Icons.alarm, color: Colors.white,size: 23,)
            )
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(this.widget.alarm.name),
              Row(
                children: [
                  Text(this.widget.alarm.getHour(),
                      style: TextStyle(
                          color: colors.mainColors['price'],
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(this.widget.alarm.getDate(),
                        style: TextStyle(
                            color: colors.mainColors['price'],
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        )
                    )
                  )
                ]
              )
            ],
          ),
          trailing: Switch(
            activeColor: colors.mainColors['price'],
            inactiveThumbColor: colors.mainColors['secondary'],
            //trackColor: MaterialStateProperty.all(Colors.red),
            //overlayColor: MaterialStateProperty.all(Colors.red),
            value: this.widget.alarm.active,
            onChanged: (value)
            {
              this.setState(()
              {
                this.widget.alarm.active = value;
              });
            },
          ),
        ),
      )
    );
  }
}