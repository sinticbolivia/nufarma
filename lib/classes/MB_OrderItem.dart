import 'SB_Object.dart';
import 'MB_CartItem.dart';
import 'dart:convert';

class MB_OrderItem extends SB_Object
{
	int 	item_id;
	int		product_id;
	String	name;
	int		qty;
	double	price;
	Map<String, dynamic>	meta;
	
	MB_OrderItem()
	{
		this.meta = {};
	}
	MB_OrderItem.fromJson(Map<String, dynamic> json)
	{
		this.item_id	= json['item_id'];
		this.product_id = json['product_id'];
		this.name		= json['name'];
		this.qty		= json['qty'] != null ? json['qty'] : json['quantity'] != null ? json['quantity'] : 0;
		this.price		= json['price'].toDouble();
	}
	MB_OrderItem.fromCartItem(MB_CartItem item)
	{
		this.product_id 	= item.product.id;
		this.name			= item.product.name;
		this.qty			= item.quantity;
		this.price			= item.price;
		this.meta			= item.meta;
	}
	Map<String, dynamic> toMap() 
	{
		var data = {
			'product_id': 	this.product_id,
			'name': 		this.name,
			'qty': 			this.qty,
			'price': 		this.price,
			'meta': 		this.meta
		};
		if( this.meta != null && this.meta['_attributes'] != null )
		{
			print('Encoding order item attributes');
			print(this.meta['_attributes']);
			String _json = json.encode(this.meta['_attributes']);
			print(_json);
			this.meta['_attributes'] = base64.encode(utf8.encode(_json));
		}
		
		return data;
	}
}
