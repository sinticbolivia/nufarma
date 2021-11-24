import 'package:flutter/material.dart';
import '../../widgets/widget-bottom-menu.dart';
import '../../widgets/checkout/steps.dart';
import '../../styles.dart' as styles;
import '../../widgets/checkout/widget-shipping-methods.dart';

class Shipping extends StatelessWidget
{
  String shippingMethod;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forma de entrega')
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Steps(step: 1),
            Expanded(
              child: WidgetShippingMethods(

              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  style: styles.buttonPrimary,
                  child: Text('Continuar', style: TextStyle(color: Colors.white)),
                  onPressed: ()
                  {
                    Navigator.of(context).pushNamed('/checkout/billing');
                  },
                )
            )
          ]
        )
      )
    );
  }

}
