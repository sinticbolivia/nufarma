import 'package:flutter/material.dart';

int primaryColorInt = 0xff2f3cb5; //blue
int secondaryColorInt = 0xfffe8b0d; //orange
int secondaryButtonColorInt = 0xff00d787;

final mainColors = {
	'blue':			Color(0xff001647),//Color(0xff0079ff),
	'lightBlue': 	Color(0xff56b5fc),
	'darkRed': 		Color(0xff781510),
	'orange': 		Color(0xffe4891c),
	'lightOrange':	Color(0xfff68c1f),
	'darkRedT': 	Color(0x77781510),
	'gray': 		Color(0xff808080),
	'lightGray':	Color(0xfff3f3f3),
	'mainGray': Color(0xffb3b3b3),
	'green':			Color(0xffb2c900), // Color(0xff00994C),
	'primary': Color(primaryColorInt),
	'secondary': Color(secondaryColorInt),
	'price': Color(0xff0071df),
	'categoryTextColor': Color(0xffa9a9a9),
	'productTextColor': Color(0xff575757),
	'btn_secondary': Color(secondaryButtonColorInt),
};

var primaryColor = MaterialColor(primaryColorInt,
	<int, Color>{
		50: mainColors['primary'],
		100: mainColors['primary'],
		200: mainColors['primary'],
		300: mainColors['primary'],
		400: mainColors['primary'],
		500: mainColors['primary'],
		600: mainColors['primary'],
		700: mainColors['primary'],
		800: mainColors['primary'],
		900: mainColors['primary'],
	}
);
