import 'dart:convert';

import '../classes/MB_Order.dart';
import '../classes/MB_Order.dart';
import '../classes/category.dart';
import '../classes/product.dart';
import 'service.dart';
import '../classes/category.dart';
import '../classes/banner.dart';
import '../classes/MB_Order.dart';

class ServiceMarket extends Service
{
  static final ServiceMarket		_instance = ServiceMarket._constructor();

  ServiceMarket._constructor() : super()
  {
  }
  factory ServiceMarket() => _instance;

  Future<List<Category>> getCategories([int page = 1]) async
  {
    String endpoint = '/categories-api-all';
    String _json = await this.get(endpoint);
    print(_json);
    var obj = json.decode(_json);
    List<Category> items = [];

    obj.forEach((data)
    {
      items.add(Category.fromMap(data));
    });
    return items;
    /*
    return Future.delayed(Duration(seconds: 3), ()
    {
      return [
        Category(id: 1, name: 'Medicamentos', featuredImage: 'assets/images/product01.jpg'),
        Category(id: 2, name: 'Vitaminas y suplementos', featuredImage: 'assets/images/product01.jpg'),
        Category(id: 3, name: 'Diabetes', featuredImage: 'assets/images/product01.jpg'),
        Category(id: 4, name: 'Bebés', featuredImage: 'assets/images/product01.jpg'),
        Category(id: 5, name: 'Ciudado personal y belleza', featuredImage: 'assets/images/product01.jpg'),
      ];
    });
     */
  }
  Future<List<Banner>> getBanners() async
  {
    //String endpoint = '/designs';
    String endpoint = '/get-slider';
    String _json = await this.get(endpoint);
    print(_json);
    var list = json.decode(_json);
    return (list as List).map((data) => Banner.fromMap(data)).toList();
  }
  Future<List<MB_Order>> getUserOrders(int userId, [int limit = 20]) async
  {
    String endpoint = '/orders-by-users/$userId/$limit';
    String _json = await this.get(endpoint);

    var list = json.decode(_json);
    return (list['data'] as List).map( (o) => MB_Order.fromMap(o)).toList();
  }
  Future<List<Product>> getBranchProducts(int branchId) async
  {
    String endpoint = '/get-products-sucursal/$branchId/a-z';
    String _json = await this.get(endpoint);
    var obj = json.decode(_json);

    return (obj['data'] as List).map( (p) => Product.fromMap(p)).toList();
  }
}