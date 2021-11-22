class Product
{
  int     id;
  String  code = '';
  String  sku = '';
  String  name = '';
  String  description = '';
  double  price = 0;
  double  discountedPrice = 0;
  String  categoryName = '';
  List    images = <Map>[];

  Product({this.id, this.name, this.description, this.price, this.discountedPrice, this.categoryName})
  {

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
}