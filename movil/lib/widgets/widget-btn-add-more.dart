import 'package:flutter/material.dart';
import '../colors.dart' as colors;

class WidgetButtonAddMore extends StatelessWidget
{
  final String text;
  final Function onTap;

  WidgetButtonAddMore({this.text, this.onTap});

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      child: Column(
        children: [
          Icon(
              Icons.add_circle_outline_outlined,
              size: 40,
              color: colors.mainColors['price']
          ),
          SizedBox(height: 10),
          Text(
              this.text,
              style: TextStyle(color: colors.mainColors['price'], fontSize: 17)
          )
        ],
      ),
      onTap: this.onTap,
    );
  }
}