import 'package:flutter/material.dart';
import '../colors.dart' as colors;

class WidgetBottomMenu extends StatefulWidget
{
	final	int	itemIndex;
	
	WidgetBottomMenu({this.itemIndex = 0});
	
	@override
	_BottomMenuState	createState() => _BottomMenuState(currentIndex: this.itemIndex);
}

class _BottomMenuState extends State<WidgetBottomMenu>
{
	List<Map<String, dynamic>> menuItems = [
		{'icon': Icons.home_outlined, 'title': 'Inicio', 'key': 'home', 'route': '/'},
		{'icon': Icons.favorite_border, 'title': 'Favoritos', 'key': 'favorites', 'route': '/favorites'},
		{'icon': Icons.alarm, 'title': 'Alarmas', 'key': 'alarm', 'route': '/alarms'},
		{'icon': Icons.speaker_phone_outlined, 'title': 'Llamar', 'key': 'call', 'route': '/call'},
		{'icon': Icons.account_circle_outlined, 'title': 'Perfil', 'key': 'profile', 'route': '/login'},

	];
	int	currentIndex = 0;
	
	_BottomMenuState({this.currentIndex});
	
	@override
	void initState()
	{
		super.initState();
	}
	@override
	Widget build(BuildContext context)
	{
		return BottomNavigationBar(
			elevation: 0,
			showSelectedLabels: false,
			currentIndex: this.currentIndex,
			items: <BottomNavigationBarItem>[
				for(int i = 0; i < this.menuItems.length; i++)
					BottomNavigationBarItem(

						icon: this.menuItems[i]['icon'] != null ? Icon(this.menuItems[i]['icon'], color: colors.mainColors['secondary'],) : null,
						//title: Text(this.menuItems[i]['title'])
						label: this.menuItems[i]['title'],
					)
			],
			onTap: (int index) async
			{
				this.setState( () 
				{
					this.currentIndex = index;
				});
				Map menuItem = this.menuItems[this.currentIndex];
				print(menuItem);

				Navigator.of(this.context).pushNamed(menuItem['route']);
			}
		);
	}
	
}
