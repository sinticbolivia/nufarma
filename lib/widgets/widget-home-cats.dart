import 'package:flutter/material.dart';

class WidgetHomeCategories extends StatelessWidget
{
  WidgetHomeCategories();

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(10),
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [0,1,2,3,4,5].map((e) => this._buildProduct(e)).toList()
      )
    );
  }
  Widget _buildProduct(e)
  {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset('assets/images/product01.jpg', fit: BoxFit.cover,)
            ),
            SizedBox(height: 10),
            Text('Categoria')
          ]
        )
      )
    );
  }
}