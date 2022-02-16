import 'package:nufarma/services/service.dart';
import '../classes/alarm.dart';

class ServiceAlarms extends Service
{
  static final ServiceAlarms _instance = ServiceAlarms._constructor();

  ServiceAlarms._constructor() : super()
  {

  }
  factory ServiceAlarms() => _instance;

  Future<List<Alarm>> readAll([int page = 1, int limit = 10]) async
  {
    await Future.delayed(Duration(seconds: 2), (){});
    return List.generate(5, (index) => Alarm(
        name: 'Alarm #${index}',
        active: (index % 2) == 0,
        datetime: DateTime.now()
    ));
  }
}