import 'package:flutter/material.dart';
import 'package:nufarma/widgets/cart/widget-cart-button.dart';
import 'package:nufarma/widgets/widget-bottom-menu.dart';
import '../../classes/alarm.dart';
import '../../widgets/alarms/alarm-item.dart';

class Alarms extends StatelessWidget
{
  List    alarms = <Alarm>[];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarmas'),
        actions: [
          WidgetCartButton()
        ],
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView.builder(
          itemCount: this.alarms.length,
          itemBuilder: (ctx, index)
          {
            return AlarmItem(alarm: this.alarms[index]);
          }
        ),
      )
    );
  }

}
