import 'dart:async';

import 'package:flutter/material.dart';
import '../classes/product.dart' as ProductModel;
import '../classes/MB_Cart.dart';
import '../colors.dart' as colors;
import '../widgets/products/gallery.dart';
import '../widgets/widget-search.dart';
import '../widgets/widget-number-picker.dart';
import '../widgets/widget-bottom-menu.dart';
import '../widgets/widget-notify.dart';
import '../widgets/cart/widget-cart-button.dart';

class Product extends StatefulWidget
{
  ProductModel.Product  product;

  Product({this.product});
  _ProductState createState() => _ProductState();
}
class _ProductState extends State<Product>
{
  int productQty = 1;
  MB_Cart         cart = MB_Cart();
  OverlayEntry overlayNotify;

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
        centerTitle: true,
        titleSpacing: 0,

        title: WidgetSearch(),
        actions: [
          WidgetCartButton()
        ],
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Gallery(product: this.widget.product,),
              SizedBox(height: 10),
              Text(this.widget.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff2f2f2f),
                      fontSize: 20
                  )
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Text('Código'),
                    Text(this.widget.product.code),
                    SizedBox(width: 5),
                    Text('Disponible')
                  ]
                )
              ),
              Divider(),
              Text('Descripción',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff2f2f2f),
                    fontSize: 18
                  )
              ),
              SizedBox(height: 10),
              Text(this.widget.product.description,
                  style: TextStyle(color: colors.mainColors['categoryTextColor'])
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      this.widget.product.priceString(),
                      style: TextStyle(color: colors.mainColors['price'], fontSize: 22, fontWeight: FontWeight.bold)
                  ),
                  Icon(Icons.favorite_outline, color: colors.mainColors['categoryTextColor'],)
                ]
              ),
              Divider(),
              WidgetNumberPicker(initialValue: 1,onQuantityChanged: (qty)
              {
                this.productQty = qty;
              },),
              SizedBox(height: 10),
              TextButton(
                child: Text('Agregar al carrito', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(color: colors.mainColors['secondary'])
                        )
                    )
                ),
                onPressed: this._addToCart,
              )
            ]
          )
        ),
      ),
    );
  }
  void _addToCart()
  {
    this.cart.addProduct(this.widget.product, this.productQty);
    this.showNotify();
  }
  void showNotify()
  {
    RenderBox renderBox = this.context.findRenderObject();
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
                    title: 'Producto agregado al carrito de compras',
                    buttons: [
                      TextButton(
                          onPressed: ()
                          {

                          },
                          child: Text('Seguir comprando', style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(
                        ),
                      ),
                      Container(
                        color: colors.mainColors['secondary'],
                        child: TextButton(
                          onPressed: ()
                          {
                            this.overlayNotify.remove();
                            Navigator.of(this.context).pushNamed('/cart');
                          },
                          child: Text('Procesar pago', style: TextStyle(color: Colors.white)),
                          /*
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    side: BorderSide(color: colors.mainColors['secondary'])
                                )
                            )
                        )
                           */
                        )
                      )
                    ],
                    onClose: ()
                    {
                      if( this.overlayNotify != null )
                        this.overlayNotify.remove();
                    },
                  )
              ),
            )
        );
      }
    );
    Overlay.of(this.context).insert(this.overlayNotify);
    var timer = Timer(Duration(seconds: 5), ()
    {
      if( this.overlayNotify != null )
        this.overlayNotify.remove();
    });
  }
}
