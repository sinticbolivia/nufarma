import 'package:flutter/foundation.dart';

class SearchProvider extends ChangeNotifier
{
	bool	_nearby	= false;
	bool	_closed	= false;
	int		_distance;
	
	set nearby(bool v)
	{
		this._nearby = v;
		this.notifyListeners();
	}
	get nearby => this._nearby;
	set closed(v)
	{
		this._closed = v;
		this.notifyListeners();
	}
	get closed => this._closed;
	
	get distance => this._distance;
	set distance(int d)
	{
		this._distance = d;
		this.notifyListeners();
	}
}
