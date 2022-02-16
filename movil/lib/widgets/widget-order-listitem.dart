import 'package:flutter/material.dart';
import '../classes/MB_Order.dart';
import '../colors.dart' as colors;
import '../styles.dart' as styles;

class WidgetOrderListItem extends StatelessWidget
{
  final MB_Order order;
  final int index;
  WidgetOrderListItem({this.order, this.index});

  @override
  Widget build(BuildContext context)
  {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('No. Pedido: ${this.order.id}'),
                  SizedBox(height: 10),
                  Text('Pedido generado: 11/11/20'),
                  SizedBox(height: 10),
                  TextButton(
                    child: Text('Entregado'.toUpperCase(), style: TextStyle(color: Colors.white)),
                    style: styles.buttonSecondary
                  )
                ]
              )
            ),
            SizedBox(width: 8),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('\$${this.order.total.toStringAsFixed(2)} MXN',
                          style: TextStyle(color: colors.mainColors['price'],
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                      ),
                      SizedBox(height: 10),
                      TextButton(
                          child: Text('> Ver detalles',
                              style: TextStyle(color: colors.mainColors['secondary'])
                          ),

                      )
                    ]
                )
            ),
          ]
        )
      )
    );
  }
}
