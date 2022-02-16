import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import '../widget-btn-add-more.dart';
import '../../classes/route-data.dart';

class WidgetBillingData extends StatefulWidget
{
  final Function(String) onSelected;

  WidgetBillingData({this.onSelected});
  @override
  _WidgetBillingDataState  createState() => _WidgetBillingDataState();
}
class _WidgetBillingDataState extends State<WidgetBillingData>
{
  String method;

  @override
  void initState()
  {
    super.initState();
    this.method = 'quick';
  }
  @override
  Widget build(BuildContext context)
  {
    return ListView(
        children: <Widget>[
          Card(
              child: Container(
                padding: EdgeInsets.only(top: 10, right: 4, bottom: 10, left: 4),
                  child: ListTile(
                    title: Text('Calle Arboles Monterubio #230, CP. 1562, Col Centro, Ciudad de Mexico, CDMX'),
                    //subtitle: Text('Recibe tu pedido en 90 mins'),
                    leading: Image.asset('assets/images/ship-icon.png', width: 40,),
                    trailing: Radio(
                      //activeColor: colors.mainColors['price'],
                      //focusColor: colors.mainColors['price'],
                      fillColor: MaterialStateProperty.all(colors.mainColors['price']),
                      //overlayColor: MaterialStateProperty.all(colors.mainColors['primary']),
                      value: 'quick',
                      groupValue: this.method,
                    ),
                    onTap: ()
                    {
                      if( this.widget.onSelected != null )
                        this.widget.onSelected('quick');
                      this.setState((){this.method = 'quick';});
                    },
                  )
              )
          ),

        ] + [
          SizedBox(height: 15),
          WidgetButtonAddMore(
            text:'Agregar nueva dirección',
            onTap: ()
            {
              Navigator.of(this.context).pushNamed(
                  '/new-address',
                  arguments: {'type': 'invoice'}
              );
            },
          )
        ]
    );
  }
}