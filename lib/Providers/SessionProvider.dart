import 'package:flutter/foundation.dart';

class SessionProvider extends ChangeNotifier
{
	bool	_authenticated 		= false;
	List	_favoriteProducts 	= [];
	List	_favoriteStores		= [];
	
	bool get authenticated => this._authenticated;
	
	set authenticated(bool v)
	{
		this._authenticated = v;
		this.notifyListeners();
	}
	
	List get favoriteProducts => this._favoriteProducts;
	set favoriteProducts(v)
	{
		this._favoriteProducts = v;
		this.notifyListeners();
	}
	
	List get favoriteStores	=> this._favoriteStores;
	
	set favoriteStores(v)
	{
		this._favoriteStores = v;
		this.notifyListeners();
	}
	bool hasStoreFavorite(int id)
	{
		var res = this._favoriteStores.contains(id);
		//this.notifyListeners();
		return res;
	}
}
