import 'product.dart';

class MB_CartItem
{
	Product				product;
	int						quantity = 0;
	double					price = 0;
	int						total = 0;
	Map						attributes = {};
	Map<String, dynamic>	meta = {};
	
	MB_CartItem({this.product, this.quantity = 1})
	{
		this.price = this.product.price;
		
		//this.increaseQuantity();
	}
	int increaseQuantity([int qty = 1])
	{
		if( qty > 1 )
			this.quantity += qty;
		else
			this.quantity++;
		return this.quantity;
	}
	double getTotal()
	{
		return this.price * this.quantity;
	}
}
