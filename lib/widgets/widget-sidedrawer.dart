import 'package:flutter/material.dart';
import '../colors.dart' as colors;

class WidgetSideDrawer extends  StatefulWidget
{
	@override
	WidgetSideDrawerState	createState() => WidgetSideDrawerState();
}
class WidgetSideDrawerState extends State<WidgetSideDrawer>
{
	List		_items = <Map>[
		{'label': 'Productos', 'icon': Icon(Icons.inbox_sharp, color: Colors.white,), 'route': '/products', 'protected': !true},
		{'label': 'Categorias', 'icon': Icon(Icons.list_outlined, color: Colors.white,), 'route': '/categories', 'protected': !true},
		{'label': 'Mi carrito', 'icon': Icon(Icons.shopping_cart_outlined, color: Colors.white,), 'route': '/shopping-cart', 'protected': !true},
		{'label': 'Alarmas', 'icon': Icon(Icons.alarm, color: Colors.white,), 'route': '/alarms', 'protected': !true},
		{'label': 'Sucursales', 'icon': Icon(Icons.shop_outlined, color: Colors.white,), 'route': '/stores', 'protected': !true},
		{'label': 'Historial', 'icon': Icon(Icons.search_outlined, color: Colors.white,), 'route': '/history', 'protected': !true},
		{'label': 'Ayuda', 'icon': Icon(Icons.help_outline, color: Colors.white,), 'route': '/help', 'protected': !true},
  ];
	Function			t;
	
	void logout(context)
	{
		Navigator.pop(context);
		Navigator.of(context).popUntil((route) => route.isFirst);
		Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
	}
	Future<void> _buildItems(context) async
	{
		var user 			= null;//await ServiceUsers().getCurrentUser();
		bool authenticated 	= false;
		String token 		= null;
		dynamic	address		= 'address';
		var settings		= {};
		double fontSize = 15;
		var align = TextAlign.left;
		var style = TextStyle(color: Colors.black87, fontSize: fontSize);
	}
	@override
	void initState()
	{
		super.initState();
	}	
	@override
	Widget build(BuildContext context)
	{
		return Theme(
			data: Theme.of(context).copyWith(
				canvasColor: colors.mainColors['primary'].withOpacity(1),//Colors.blue[900].withOpacity(0.6),
			),
			child: new Drawer(
				child: ListView(
					children:
						[this._getHeader()] +
						this._items.map((menuItem) => this._buildMenuItem(menuItem)).toList() +
						[this._getFooter()]
				)
			)
		);
	}
	Widget _getHeader()
	{
		return Container(
			padding: EdgeInsets.all(15),
			color: Colors.white,
			child: Row(
					children: [
						Expanded(
								child: Center(
										child: CircleAvatar(
												backgroundImage: AssetImage('assets/images/no-image.jpg'),
												radius: 50
										)
								)
						),
						SizedBox(width: 10),
						Expanded(
							child: Column(
									crossAxisAlignment: CrossAxisAlignment.stretch,
									children: [
										Text('Invitado', style: TextStyle(color: colors.mainColors['primary'], fontWeight: FontWeight.bold)),
										SizedBox(height: 5),
										InkWell(
											child: Text('Editar',
													style: TextStyle(color: colors.mainColors['secondary'], fontWeight: FontWeight.bold)
											),
											onTap: ()
											{
												Navigator.of(context).pushNamed('/account');
											},
										)
									]
							)
						)
					]
			)
		);
	}
	Widget _getFooter()
	{
		return Container(
			margin: EdgeInsets.only(top: 15),
			child: TextButton(
				child: Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
				style: ButtonStyle(
					padding: MaterialStateProperty.all(EdgeInsets.all(15)),
					backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
				),
			)
		);
	}
	Widget _buildMenuItem(Map menuItem)
	{
		var style = TextStyle(color: Colors.white, fontSize: 15);
		Icon icon = menuItem['icon'] != null ? (menuItem['icon'] as Icon) : Icon(Icons.question_answer);

		return new ListTile(
				leading: icon,
				title: Text(menuItem['label'], textAlign: TextAlign.left, style: style),
				onTap: ()
				{
					Navigator.pop(context);
					if( menuItem['route'] != null )
						Navigator.of(context).pushNamed(menuItem['route']);
				}
		);
	}
}
