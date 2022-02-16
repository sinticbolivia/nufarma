import 'package:flutter/material.dart';
import 'package:nufarma/widgets/cart/widget-cart-button.dart';
import 'package:nufarma/widgets/widget-bottom-menu.dart';
import 'package:nufarma/widgets/widget-btn-add-more.dart';
import '../../classes/alarm.dart';
import '../../widgets/alarms/alarm-item.dart';
import '../../services/alarms.dart';
import '../../colors.dart' as colors;

class Alarms extends StatefulWidget
{
  @override
  _AlarmsState  createState() => _AlarmsState();

}
class _AlarmsState extends State<Alarms>
{
  List    alarms = <Alarm>[];
  int     currentPage = 0;
  bool    hasNextPage = true;
  bool    loadingMore = false;
  bool    firstLoad   = true;

  @override
  void initState()
  {
    super.initState();
    this._getMore();
  }
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
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: this.firstLoad ? Center(child: CircularProgressIndicator()) : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: this.alarms.length,
                    itemBuilder: (ctx, index)
                    {
                      return AlarmItem(alarm: this.alarms[index]);
                    }
                )
              ),
              WidgetButtonAddMore(
                text: 'Agregar nueva alarma',
                onTap: ()
                {
                  Navigator.of(this.context).pushNamed('/alarms/new');
                },
              ),
              if( this.loadingMore )
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(child: CircularProgressIndicator())
                )
            ]
          ),
        )
    );
  }
  void _getMore() async
  {
    if( this.loadingMore )
      return;

    this.loadingMore = true;
    var items = await ServiceAlarms().readAll(this.currentPage + 1);
    this.firstLoad = false;
    this.loadingMore = false;
    if( items.length <= 0 )
    {
      this.hasNextPage = false;
      this.setState(() {});
      return;
    }
    this.alarms.addAll(items);
    this.setState(() {});
  }
}
