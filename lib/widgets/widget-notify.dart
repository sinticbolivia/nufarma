import 'package:flutter/material.dart';
import '../colors.dart' as colors;

class WidgetNotify extends StatelessWidget
{
  final String  title;
  final String  description;
  final List    buttons;
  final Function  onClose;

  WidgetNotify({this.title = '', this.description = '', this.buttons, this.onClose});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        color: colors.mainColors['primary']
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text('X', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Text(this.title, style: TextStyle(color: Colors.white, fontSize: 15)),
                    SizedBox(height: 10),
                    Text(this.description, style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(height: 10),
                  ]
              )
            )
          ),
          SizedBox(height: 5),
          if( this.buttons.length > 0)
          Row(
            children: [
              for(var btn in this.buttons)
                Expanded(
                  child: btn
                ),
            ]
          )
        ]
      )
    );
  }
}
