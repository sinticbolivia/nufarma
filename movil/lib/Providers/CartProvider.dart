import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier
{
	int		_quantity = 0;
	
	int get quantity => this._quantity;
	
	set quantity(int nqty)
	{
		this._quantity = nqty;
		this.notifyListeners();
	}
}