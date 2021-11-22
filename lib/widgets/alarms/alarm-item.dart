import 'package:flutter/material.dart';
import '../../classes/alarm.dart';

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
    return Container(
      child: ListTile(
        title: Text(this.widget.alarm.name),
        trailing: Switch(
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
    );
  }
}