import 'package:flutter/material.dart';
import '../widgets/widget-bottom-menu.dart';
import '../classes/MB_Cart.dart';
import '../widgets/cart/WidgetCartItem.dart';
//import '../widgets/WidgetButton.dart';
//import 'checkout.dart';
import '../classes/SB_Globals.dart';
import '../colors.dart' as colors;


class Cart extends StatefulWidget
{
	@override
	_CartState		createState() => _CartState();
}
class _CartState extends State<Cart> with RouteAware
{
	MB_Cart	_cart = MB_Cart();
	bool editing	= false;
	List<Widget>	cartItems = [];
	
	void _updateCart()
	{
		this.setState(()
		{
			this._cart = MB_Cart();
		});
	}
	List<Widget> _buildItems()
	{
		double delivery_amount = this._cart.getDeliveryCost();
		var items = <Widget>[];
		this._cart.getItems().forEach( (cartItem) 
		{
			items.add(
				WidgetCartItem(item: cartItem, editing: this.editing, notifyCart: this._updateCart)
			);
		});
		
		return items;
	}
	@override
	Widget build(BuildContext context)
	{
		var actions = <Widget>[];
		this.setState( () 
		{
			if( this._cart.getItems().length <= 0 )
				return;
			this.cartItems = this._buildItems();
			if( !this.editing )
			{
				actions.addAll([
					IconButton(
						tooltip: 'Modificar mi pedido',
						icon: Icon(Icons.edit),
						onPressed: ()
						{
							print('Editando pedido');
							this.setState(() 
							{
								this.editing = true;
							});
						}
					),
				]);
			}
			else
			{
				actions.addAll([
					IconButton(
						tooltip: 'Guardar cambios en el pedido',
						icon: Icon(Icons.save),
						onPressed: ()
						{
							this.setState(() 
							{
								this.editing = false;
							});
						}
					),
				]);
			}
		});
		return Scaffold(
			appBar: AppBar(
				title: Text('Mi carrito'),
				actions: actions
			),
			bottomNavigationBar: WidgetBottomMenu(),
			body: SafeArea(
				child: Container(
					child: this._cart.getItems().length <= 0 ? this._emptyContent() : Column(
							children: <Widget>[
									Expanded(
											child: ListView(
													children: <Widget>[
														Container(
																child: Container(
																	padding: EdgeInsets.all(8),
																	child: Row(
																		mainAxisAlignment: MainAxisAlignment.end,
																		children: [
																			Text('Total '),
																			Text(this._cart.getItems().length.toString() + ' elementos',
																					style: TextStyle(color: colors.mainColors['secondary']))
																		]
																	),
																)
														)

													] + this.cartItems
											)
									),
									Container(
										padding: EdgeInsets.all(10),
										color: Colors.white,
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.stretch,
											children: [
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: [
														Text('Subtotal', textAlign: TextAlign.left,),
														Text('\$' + this._cart.getTotals().toStringAsFixed(2))
													]
												),
												SizedBox(height: 5),
												Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															Text('Total', textAlign: TextAlign.left,
																style: TextStyle(fontSize: 15)
															),
															Text(
																'\$' + this._cart.getTotals().toStringAsFixed(2) + ' MXN',
																style: TextStyle(
																	color: colors.mainColors['price'],
																	fontSize: 18,
																	fontWeight: FontWeight.bold
																)
															)
														]
												),
												SizedBox(height: 5),
												TextButton(
													child: Text('Proceder con el pago', style: TextStyle(color: Colors.white)),
													style: ButtonStyle(
															backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
															shape: MaterialStateProperty.all<RoundedRectangleBorder>(
																	RoundedRectangleBorder(
																			borderRadius: BorderRadius.circular(6.0),
																			side: BorderSide(color: colors.mainColors['secondary'])
																	)
															)
													),
													onPressed: ()
													{
														Navigator.of(this.context).pushNamed('/checkout/address');
													}
												)
											]
										)
									)
							]
					)
				),
			)
		);
	}
	Widget _emptyContent()
	{
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Icon(Icons.shopping_cart_outlined, size: 100, color: Theme.of(this.context).primaryColor,),
					Container(
							margin: EdgeInsets.all(10),
							child: Center(
									child: Text(
											'No existen productos en su pedido',
											textAlign: TextAlign.center,
											style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
									)
							)
					)
				]
		);
	}
}
