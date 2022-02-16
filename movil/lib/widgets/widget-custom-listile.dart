import 'package:flutter/material.dart';

class WidgetListTile extends StatelessWidget
{
  final dynamic title;
  final Widget prefix;
  final Function onTap;

  WidgetListTile({this.title, this.prefix, this.onTap});

  @override
  Widget build(BuildContext context)
  {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xffe1e1e1))
            )
        ),
        child:ListTile(
          leading: this.prefix,
          title: title is String ? Text(this.title, style: TextStyle(color: Color(0xff4f4f4f))) : this.title,
          onTap: this.onTap,
        )
    );
  }
}
