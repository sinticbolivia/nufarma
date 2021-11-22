import 'MB_CartItem.dart';
import 'product.dart';
//import 'SB_User.dart';
import 'MB_Order.dart';
import 'SB_Globals.dart';
//import '../Services/ServiceUsers.dart';

class MB_Cart
{
	List<MB_CartItem> _items;
	double	_total = 0;
	static final MB_Cart _instance = MB_Cart._privateConstructor();
	
	MB_Cart._privateConstructor()
	{
		this._items = [];
	}
	factory MB_Cart()
	{
		return _instance;
	}
	MB_CartItem addProduct(Product product, [int qty = 1, double price = 0, bool increase = true])
	{
		var cartItem = this.productExists(product.id);
		if( cartItem == null )
		{
			cartItem = new MB_CartItem(product: product, quantity: qty);
			this._items.add( cartItem );
			if( price > 0 )
				cartItem.price = price;
		}
		else
		{
			if( /*cartItem.quantity < 10*/ increase )
				cartItem.increaseQuantity(qty);
			else
				cartItem.quantity = qty;
		}
		return cartItem;
	}
	void removeProduct(int productId)
	{
		var toRemove = null;
		this._items.forEach( (item) 
		{
			if( item.product.id == productId )
			{
				toRemove = item;
			}
		});
		if( toRemove != null )
		{
			this._items.remove(toRemove);
		}
	}
	MB_CartItem productExists(int productId)
	{
		var cartItem = null;
		
		this._items.forEach( (item) 
		{
			if( item.product.id == productId )
			{
				cartItem = item;
			}
		});
		
		return cartItem;
	}
	void clear()
	{
		this._items = new List();
	}
	double calculateTotals()
	{
		this._total = 0;
		this._items.forEach( (MB_CartItem item) 
		{
			this._total += item.getTotal();
		});
		
		return this._total;
	}
	double getTotals()
	{
		return this.calculateTotals();
	}
	List getItems()
	{
		return this._items;
	}
	double getDeliveryCost()
	{
		var settings 			= SB_Globals.getVar('settings');
		if( settings == null )
			return 0;
			
		double delivery_amount 	= settings['delivery_amount'] != null ? double.parse(settings['delivery_amount'].toString()) : 0;
		double total 			= this.getTotals();
		double min_delivery_amount = settings['delivery_free_amount'] != null ? double.parse(settings['delivery_free_amount'].toString()) : 0;
		
		if( total >= min_delivery_amount )
		{
			delivery_amount = 0;
		}
		return delivery_amount;
	}
}
