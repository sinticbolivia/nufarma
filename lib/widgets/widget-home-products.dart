import 'package:flutter/material.dart';
import '../classes/product.dart';
import '../colors.dart' as colors;
import '../pages/product.dart' as PageProduct;

class WidgetHomeProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 300,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [0, 1, 2, 3, 4, 5].map((e) => this._buildProduct(e, context)).toList()
        )
    );
  }

  Widget _buildProduct(e, context) {
    var product = Product(
        categoryName: 'Medicamentos',
        name: 'Broncolin Sugar Free Eucalipto',
        description: '7 Tabletas Caja Pantoprazol 20 MG, alivia y previene la gastritis, acidez, reflujo, esofagitis, agruras.\nLaboratorio Pisa\nLote 718191',
        price: 65,
        discountedPrice: 61
    );
    product.images.addAll(<Map>[
      {'type': 'local', 'url': 'assets/images/product02.jpg'},
      {'type': 'local', 'url': 'assets/images/product01.jpg'},
      {'type': 'local', 'url': 'assets/images/product01.jpg'},
    ]);
    var featuredImage = product.getFeaturedImage()['type'] == 'local' ?
      Image.asset(product.getFeaturedImage()['url'], fit: BoxFit.cover,) :
      Image.network(product.getFeaturedImage()['url'], fit: BoxFit.cover,);
    return Container(
      width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xffd7d7d7),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(right: 10),
        child: InkWell(
            child: Container(
              padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: featuredImage
                      ),
                      SizedBox(height: 10),
                      Text(product.categoryName, style: TextStyle(color: colors.mainColors['categoryTextColor'])),
                      SizedBox(height: 10),
                      Text(product.name.toUpperCase(), style: TextStyle(color: colors.mainColors['productTextColor'])),
                      SizedBox(height: 10),
                      Divider(),
                      Row(
                          children: [
                            Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('\$' + product.discountedPrice.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: colors.mainColors['price'],
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      Text('\$' + product.price.toStringAsFixed(2),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: colors.mainColors['categoryTextColor'],
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.lineThrough
                                          )
                                      ),
                                    ]
                                  )
                                ]
                            ),
                            SizedBox(width: 5),
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      width: 40,
                                      child: TextButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    side: BorderSide(color: colors.mainColors['secondary'])
                                                )
                                            )
                                        ),
                                        child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                                      )
                                  )
                                ]
                            )
                          ]
                      )
                    ]
                )
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PageProduct.Product(product: product,))
              );
            }
        )
    );
  }
}