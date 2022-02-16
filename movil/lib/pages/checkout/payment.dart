import 'package:flutter/material.dart';
import '../../widgets/widget-bottom-menu.dart';
import '../../widgets/checkout/steps.dart';
import '../../styles.dart' as styles;
import '../../widgets/checkout/widget-payment-methods.dart';
import '../../mixins/notification.dart';
import '../../colors.dart' as colors;

class Payment extends StatefulWidget
{
  @override
  _PaymentState createState() => _PaymentState();

}
class _PaymentState extends State<Payment> with HasNotification
{
  String paymentMethod;

  @override
  void initState()
  {
    super.initState();

  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formas de pago')
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Steps(step: 3),
            Expanded(
              child: WidgetPaymentMethods(

              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  style: styles.buttonPrimary,
                  child: Text('Finalizar compra', style: TextStyle(color: Colors.white)),
                  onPressed: ()
                  {
                    this.processOrder();
                  },
                )
            )
          ]
        )
      )
    );
  }
  void processOrder() async
  {
    this._showSuccess();
  }
  void _showSuccess()
  {
    this.notifyContext = this.context;
    this.showNotify(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Gracias', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            children: [
              Text('Su pedido ', style: TextStyle(color: Colors.white,)),
              Text('No. 716381 ', style: TextStyle(color: colors.mainColors['secondary'])),
              Text('esta en proceso', style: TextStyle(color: Colors.white,)),
            ]
          )
        ]
      ),
      buttons: [
        TextButton(
          onPressed: ()
          {
            this.removeNotify();
          },
          child: Text('Seguir comprando', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(),
        ),
        Container(
            color: colors.mainColors['secondary'],
            child: TextButton(
              onPressed: ()
              {
                this.removeNotify();
                Navigator.of(this.notifyContext).pushNamedAndRemoveUntil('/', (route) => false);
                Navigator.of(this.notifyContext).pushNamed('/checkout/summary');
              },
              child: Text('Ver resumen de compra', style: TextStyle(color: Colors.white)),
            )
        )
      ]
    );
  }
}
