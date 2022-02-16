import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../classes/MB_CartItem.dart';
import '../../classes/MB_Cart.dart';
import '../../Providers/CartProvider.dart';

class WidgetCartItem extends StatefulWidget
{
	MB_CartItem item;
	bool editing;
	Function()	notifyCart;
	
	WidgetCartItem({this.item, this.editing = false, this.notifyCart = null});
	@override
	WidgetCartItemState	createState() => WidgetCartItemState();
}
class WidgetCartItemState extends State<WidgetCartItem>
{
	MB_Cart		_cart = MB_Cart();
	@override
	Widget build(BuildContext context)
	{
		var provider = Provider.of<CartProvider>(context);
		var widgets = <Widget>[];
		if( this.widget.editing )
		{
			widgets.add(Container(
				child: IconButton(
					color: Colors.red,
					icon: Icon(Icons.delete),
					onPressed: ()
					{
						this.setState( () 
						{
							this._cart.removeProduct(this.widget.item.product.id);
							this.widget.notifyCart();
						});
						provider.quantity = this._cart.getItems().length;
					}
				)
			));
		}
		widgets.add(
			Container(
				margin: EdgeInsets.only(right: 8),
				child: Image.asset(this.widget.item.product.getThumbnailUrl(), //Image.network(this.widget.item.product.getThumbnailUrl(),
						width: 80, height: 80, fit: BoxFit.fill
				)
			),
		);
		if( !this.widget.editing )
		{
			widgets.addAll([
				Expanded(
					child: Text(this.widget.item.quantity.toString() + ' x ' + this.widget.item.product.name)
				),
			]);
		}
		else
		{
			widgets.addAll([
				Expanded(
					child: Column(
						children: [
							Text(this.widget.item.product.name),
							Row(
								children:[
									FlatButton(
										child: Text('-', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
										onPressed: ()
										{
											this.setState(() 
											{
												this.widget.item.quantity--;
											});
											provider.quantity = this._cart.getItems().length;
										}
									),
									Text(this.widget.item.quantity.toString(), style: TextStyle(fontSize: 20)),
									FlatButton(
										child: Text('+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
										onPressed: ()
										{
											this.setState(() 
											{
												this.widget.item.quantity++;						
											});
											provider.quantity = this._cart.getItems().length;
										}
									),
								]
							)
						]
					)
				),
			]);
		}
		widgets.addAll([
			Container(
				padding: EdgeInsets.all(8),
				child: Text(this.widget.item.getTotal().toStringAsFixed(2))
			)
		]);
		return Card(
			child: Container(
				//margin: EdgeInsets.all(10),
				child: Row(
					children: widgets
				)
			)
		);
	}
}
