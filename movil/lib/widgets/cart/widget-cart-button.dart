import 'package:flutter/material.dart';
import '../../classes/MB_Cart.dart';

class WidgetCartButton extends StatefulWidget
{
  @override
  _WidgetCartButtonState  createState() => _WidgetCartButtonState();
}

class _WidgetCartButtonState extends State<WidgetCartButton>
{
  MB_Cart cart = MB_Cart();

  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: ()
            {
              Navigator.of(context).pushNamed('/cart');
            }
          ),
          Positioned(
            right: 5,
              top: 5,
              child: Container(
                width: 15,
                height: 15,
                padding: EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                    this.cart.getItems().length.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 10)
                )
              )
          )
        ],
      )
    );
  }
}