import 'package:flutter/material.dart';
import 'package:nufarma/widgets/widget-custom-listile.dart';
import '../widgets/widget-bottom-menu.dart';
import '../widgets/cart/widget-cart-button.dart';

class Help extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
        actions: [
          WidgetCartButton(),
        ],
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView(
          children: [
            WidgetListTile(
              prefix: Icon(Icons.help_outline),
              title: 'Preguntas frecuentes'
            ),
            WidgetListTile(
              prefix: Icon(Icons.help_outline),
              title: '¿Necesitas ayuda? Contáctanos'
            ),
            WidgetListTile(
              prefix: Icon(Icons.help_outline),
              title: Text('Términos y Privacidad')
            ),
            WidgetListTile(
                prefix: Icon(Icons.help_outline),
                title: Text('Info. de la App')
            ),
          ],
        )
      ),
    );
  }
}
