import 'package:flutter/foundation.dart';

class Product
{
  int     id;
  String  code = '';
  String  sku = '';
  String  name = '';
  String  description = '';
  double  price = 0;
  double  price_sale = 0;
  double  get discountedPrice => this.price;
  String  categoryName = '';
  String  iva = '';
  String  slug = '';
  int     stock = 0;
  String  department = '';
  int     status = 0;
  List    pictures = [];
  List    images = <Map>[];

  Product({this.id, this.name, this.description, this.price, this.price_sale, this.categoryName})
  {

  }
  Product.fromMap(Map<String, dynamic> data)
  {
    this.loadData(data);
  }
  void loadData(Map<String, dynamic> data)
  {
    try
    {
      this.id = data['id'];
      this.name = data['name'] ?? '';
      this.iva  = data['iva'] ?? '';
      this.price        = data['price'] != null ? double.tryParse(data['price'].toString()) : 0.0;
      this.price_sale   = data['price_sale'] != null ? double.tryParse(data['price_sale'].toString()) : 0.0;
      this.pictures     = data['pictures'] ?? [];
      this.description  = data['description'] ?? '';
      this.stock        = data['stock'] ?? 0;
      this.sku          = data['sku'] ?? '';
      this.slug         = data['slug'] ?? '';
      this.status       = data['status'] ?? 0;
    }
    catch(e)
    {
      print('LOAD PRODUCT ERROR: $e');
    }
  }
  String priceString()
  {
    String symbol = '\$';
    String currency ='MXN';

    return symbol + this.price.toStringAsFixed(2) + ' ' + currency;
  }
  Map getFeaturedImage()
  {
    if( this.images.length <= 0 )
      return null;
    return this.images[0];
  }
  String getThumbnailUrl()
  {
    var img = this.getFeaturedImage();
    return img != null ? img['url'] : '';
  }
  Map<String, dynamic> toMap()
  {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'sku': this.sku,
      'slug': this.slug,
    };
  }
}