import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/widget-notify.dart';
import '../colors.dart' as colors;

mixin HasNotification
{
  BuildContext  notifyContext;
  OverlayEntry overlayNotify;
  Timer notifyTimer;
  bool  hasNotifyOverlay = false;
  bool  hasNotifyTimer    = false;
  int   notifyTimeout     = 5;

  void showNotify({Widget body = null, List<Widget> buttons = const []})
  {
    RenderBox renderBox = this.notifyContext.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    this.overlayNotify = OverlayEntry(
        builder: (context)
        {
          return Positioned(
              top: 20,
              //right: 0,
              left: 0,
              width: size.width,
              child: Material(
                child: Container(
                    height: size.height * 0.25,
                    child: WidgetNotify(
                      body: body,
                      title: 'Producto agregado al carrito de compras',
                      buttons: buttons,
                      onClose: ()
                      {
                        this.removeNotify();
                      },
                    )
                ),
              )
          );
        }
    );
    Overlay.of(this.notifyContext).insert(this.overlayNotify);
    if( this.hasNotifyTimer )
      this.notifyTimer = Timer(Duration(seconds: this.notifyTimeout), ()
      {
        this.removeNotify();
      });
  }
  void removeNotify()
  {
    if( this.notifyTimer != null )
      this.notifyTimer.cancel();
    if( Overlay.of(this.notifyContext) != null && this.overlayNotify != null )
    {
      this.overlayNotify.remove();
      this.overlayNotify = null;
    }
  }
}