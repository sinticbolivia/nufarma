import 'package:flutter/material.dart';

import '../../widgets/cart/widget-cart-button.dart';
import '../../widgets/widget-bottom-menu.dart';
import '../../widgets/widget-custom-listile.dart';
import '../../colors.dart' as colors;

class Account extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi cuenta'),
        actions: [
          WidgetCartButton()
        ],
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20),
            this._buildHeader(context),
            SizedBox(height: 20),
            WidgetListTile(
              prefix: Icon(Icons.search),
              title: 'Historial de pedidos',
            ),
            WidgetListTile(
              prefix: Icon(Icons.location_on_outlined),
              title: 'Dirección de envio',
            ),
            WidgetListTile(
              prefix: Icon(Icons.monetization_on_outlined),
              title: 'Dirección de facturación',
            ),
            WidgetListTile(
              prefix: Icon(Icons.account_circle_outlined),
              title: 'Datos personales',
            ),
            WidgetListTile(
              prefix: Icon(Icons.favorite_outline),
              title: 'Lista de deseos',
            ),
          ],
        )
      ),
    );
  }
  Widget _buildHeader(BuildContext context)
  {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/no-image.jpg'),
                    radius: 50
                )
            ),
            SizedBox(height: 15),
            Text('Invitado', style: TextStyle(color: colors.mainColors['primary'], fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            InkWell(
              child: Text('Editar',
                  style: TextStyle(color: colors.mainColors['secondary'], fontWeight: FontWeight.bold)
              ),
              onTap: ()
              {
                Navigator.of(context).pushNamed('/account');
              },
            )
          ]
      )
    );
  }
}
