import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import '../../classes/payment-method.dart';

class WidgetPaymentMethods extends StatefulWidget
{
  final Function(PaymentMethod) onSelected;
  
  WidgetPaymentMethods({this.onSelected});

  @override
  _WidgetPaymentMethodsState  createState() => _WidgetPaymentMethodsState();
}
class _WidgetPaymentMethodsState extends State<WidgetPaymentMethods>
{
  int methodId;
  List    methods = <PaymentMethod>[];

  @override
  void initState()
  {
    super.initState();
    this.methodId = -1;
    this.loadData();
  }
  void loadData() async
  {
    this.methods.addAll(<PaymentMethod>[
      PaymentMethod(id: 1, name: 'Transferencia Electronica de Fondos'),
      PaymentMethod(id: 2, name: 'Tarjeta de Crédito / Débito'),
      PaymentMethod(id: 3, name: 'Terminal Bancaria en contra entrega'),
      PaymentMethod(id: 4, name: 'Depósito Bancario'),
    ]);
    this.setState(() { });
  }
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: this.methods.length,
      itemBuilder: (ctx, index)
      {
        var pm = this.methods[index] as PaymentMethod;
        return Card(
            child: Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: ListTile(
                title: Text(pm.name),
                leading: Image.asset('assets/images/ship-icon.png', width: 40,),
                trailing: Radio(
                  //activeColor: colors.mainColors['price'],
                  //focusColor: colors.mainColors['price'],
                  fillColor: MaterialStateProperty.all(colors.mainColors['price']),
                  //overlayColor: MaterialStateProperty.all(colors.mainColors['primary']),
                  value: pm.id,
                  groupValue: this.methodId,
                ),
                onTap: ()
                {
                  if( this.widget.onSelected != null )
                    this.widget.onSelected(pm);
                  this.setState((){this.methodId = pm.id;});
                },
              )
            )
        );
      },
    );
  }
}