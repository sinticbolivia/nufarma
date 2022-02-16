import 'package:flutter/material.dart';
import '../../colors.dart' as colors;

class WidgetShippingMethods extends StatefulWidget
{
  final Function(String) onSelected;
  
  WidgetShippingMethods({this.onSelected});
  @override
  _WidgetShippingMethodsState  createState() => _WidgetShippingMethodsState();
}
class _WidgetShippingMethodsState extends State<WidgetShippingMethods>
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
        children: [
          Card(
              child: Container(
                  child: ListTile(
                    title: Text('Entrega inmediata'),
                    subtitle: Text('Recibe tu pedido en 90 mins'),
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
          Card(
              child: Container(
                  child: ListTile(
                    title: Text('Entrega programada'),
                    subtitle: Text('Elige el dia y horario de tu entrega'),
                    leading: Image.asset('assets/images/ship-icon.png', width: 40,),
                    trailing: Radio(
                      activeColor: colors.mainColors['price'],
                      focusColor: colors.mainColors['price'],
                      fillColor: MaterialStateProperty.all(colors.mainColors['price']),
                      value: 'scheduled',
                      groupValue: this.method,
                    ),
                    onTap: ()
                    {
                      if( this.widget.onSelected != null )
                        this.widget.onSelected('scheduled');
                      this.setState((){this.method = 'scheduled';});
                    },
                  )
              )
          )
        ]
    );
  }
}