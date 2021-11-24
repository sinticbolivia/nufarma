import 'package:intl/intl.dart';

class Alarm
{
  int       id;
  String    name;
  DateTime  datetime;
  bool      active = false;

  Alarm({this.id, this.name, this.datetime, this.active});

  String getHour()
  {
    final format = DateFormat('jm');
    return format.format(this.datetime);
  }
  String getDate()
  {
    final format = DateFormat('d, MMMM yy');
    return format.format(this.datetime);
  }
}