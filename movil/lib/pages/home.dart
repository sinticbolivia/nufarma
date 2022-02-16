import 'package:flutter/material.dart';
import '../widgets/widget-search.dart';
import '../colors.dart' as colors;
import '../widgets/widget-carousel.dart';
import '../widgets/widget-home-cats.dart';
import '../widgets/widget-home-products.dart';
import '../widgets/widget-bottom-menu.dart';
import '../widgets/widget-sidedrawer.dart';
import '../widgets/cart/widget-cart-button.dart';

class Home extends StatelessWidget
{
  Home();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Image.asset('assets/images/logo-text.png', height: 50)),
        actions: [
          WidgetCartButton()
        ],
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      drawer: WidgetSideDrawer(),
      body: Container(
        color: Color(0xfff2f2f2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetSearch(),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Envio a Calle Arboles Monterubio 230, Ciudad de Mexico...',
                        style: TextStyle(color: Color(0xffbababa), fontSize: 12)
                    )
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(colors.mainColors['secondary'])
                    ),
                    child: Text('Cambiar dirección'),

                  )
                ]
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    WidgetCarousel(),
                    WidgetHomeCategories(),
                    WidgetHomeProducts(),
                  ]
                )
              )
            )
          ]
        )
      ),
    );
  }
}
