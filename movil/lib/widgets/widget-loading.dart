import 'package:flutter/material.dart';

class WidgetLoading
{
  static Future<void> show(BuildContext context, GlobalKey key, String message) async
  {
    message = message.isEmpty ? "Procesando...." : message;

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        //Image.asset('assets/images/logo-animado.gif', width: 100,),
                        SizedBox(height: 10,),
                        Text(message, style: TextStyle(color: Colors.white),)
                      ]),
                    )
                  ]
              )
          );
        }
    );
  }
  static void hide(GlobalKey key)
  {
    Navigator.of(key.currentContext, rootNavigator: true).pop();
  }
}