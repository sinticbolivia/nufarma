import 'package:flutter/material.dart';
import '../../widgets/widget-bottom-menu.dart';
import '../../styles.dart' as styles;
import '../../colors.dart' as colors;

class OrderSummary extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Resument de compra')),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                  children: [
                    Container(
                        child: Column(
                            children: [
                              Text('Su pedido No.716381'),
                              SizedBox(height: 10),
                              TextButton(
                                style: styles.buttonPrimary,
                                child: Text('Entregado', style: TextStyle(color: Colors.white)),
                              )
                            ]
                        )
                    ),
                    Container(
                        color: Colors.white,
                        child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Generado:'),
                                  Text('15/10/21')
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Forma de pago:'),
                                  Text('Transferencia Bancaria')
                                ],
                              ),
                              SizedBox(height: 10),
                              this._getTotals(),
                              SizedBox(height: 10),
                              this._buildSentTo(),
                              SizedBox(height: 10),
                              this._buildBilling(),
                            ]
                        )
                    )
                  ]
              )
            ),
            Container(
              child: TextButton(
                child: Text('Seguir comprando', style: TextStyle(color: Colors.white)),
                style: styles.buttonPrimary,
                onPressed: ()
                {
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                },
              )
            )
          ]
        )
      )
    );
  }
  Widget _getTotals()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(8),
            color: Colors.grey.withOpacity(0.4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal (25 articulos):'),
                    Text('\$2,150.3')
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Todos los precios incluyen IVA'),
                  ],
                ),
              ]
            )
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('\$2,150.3 MXN', style: TextStyle(color: colors.mainColors['price'], fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ],
    );
  }
  Widget _buildSentTo()
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Enviado a', style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey.withOpacity(0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Jose Juan'),
                Text('Av. Gustavo Montez No. 722 Edif.62 Col. Centro, Ciudad de Mexico, 54721. CDMX'),
                SizedBox(height: 10),
                Text('55 772 232 23')
              ],
            )
          )
        ],
      )
    );
  }
  Widget _buildBilling()
  {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Datos de Facturación', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                padding: EdgeInsets.all(8),
                //color: Colors.grey.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('RFC: UYSD2732691H'),
                    Text('Av. Gustavo Montez No. 722 Edif.62 Col. Centro, Ciudad de Mexico, 54721. CDMX'),
                  ],
                )
            )
          ],
        )
    );
  }
}