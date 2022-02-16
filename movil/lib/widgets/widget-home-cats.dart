import 'package:flutter/material.dart';

import '../classes/category.dart';
import '../services/market.dart';
import '../services/market.dart';

class WidgetHomeCategories extends StatelessWidget
{
  WidgetHomeCategories();

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(10),
      height: 170,
      child: FutureBuilder<List<Category>>(
        future: ServiceMarket().getCategories(),
        builder: (ctx, snapshot)
        {
          if( snapshot.connectionState == ConnectionState.waiting )
            return CircularProgressIndicator();
          if( snapshot.hasData )
          {
            return ListView(
                scrollDirection: Axis.horizontal,
                children: (snapshot.data as List<Category>).map((e) => this._buildProduct(e)).toList()
            );
          }

        },
      )
    );
  }
  Widget _buildProduct(Category cat)
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
              child: cat.featuredImage != null && cat.featuredImage.isNotEmpty ?
                Image.network(cat.featuredImage.replaceAll('/public', ''), fit: BoxFit.cover,) :
                Image.asset('assets/images/product01.jpg', fit: BoxFit.cover,)
            ),
            SizedBox(height: 10),
            Text(cat.name)
          ]
        )
      )
    );
  }
}