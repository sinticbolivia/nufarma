import 'package:flutter/material.dart';
import '../../widgets/widget-bottom-menu.dart';
import '../../widgets/checkout/steps.dart';
import '../../styles.dart' as styles;
import '../../widgets/checkout/widget-billing-data.dart';

class Billing extends StatelessWidget
{
  String shippingMethod;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facturación')
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Steps(step: 2),
            Expanded(
              child: WidgetBillingData(

              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  style: styles.buttonPrimary,
                  child: Text('Continuar', style: TextStyle(color: Colors.white)),
                  onPressed: ()
                  {
                    Navigator.of(context).pushNamed('/checkout/payment');
                  },
                )
            )
          ]
        )
      )
    );
  }

}
