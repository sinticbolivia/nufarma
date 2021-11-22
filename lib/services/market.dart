import 'service.dart';
import '../classes/category.dart';

class ServiceMarket extends Service
{
  static final ServiceMarket		_instance = ServiceMarket._constructor();

  ServiceMarket._constructor() : super()
  {
  }
  factory ServiceMarket() => _instance;

  Future<List<Category>> getCategories([int page = 1]) async
  {
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
  }
}