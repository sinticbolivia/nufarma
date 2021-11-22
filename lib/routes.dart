import 'package:flutter/material.dart';

import 'pages/new-address.dart';
import 'pages/checkout/address.dart';
import 'pages/cart.dart';
import 'pages/home.dart';
//import 'pages/welcome.dart';
import 'pages/login.dart';
//import 'pages/register.dart';
//import 'pages/checkout.dart';
//import 'pages/cart.dart';
//import 'pages/users/Orders.dart';
//import 'pages/users/Account.dart';

final appRoutes = <String, WidgetBuilder>{
	'/': (BuildContext context) => Home(),
	'/home': (BuildContext context) => Home(), 
	'/login': (BuildContext context) => Login(),
	//'/register': (BuildContext context) => Register(),
	//'/checkout': (BuildContext context) => Checkout(),
	'/cart': (BuildContext context) => Cart(),
	'/checkout/address': (BuildContext context) => Address(),
	'/new-address': (BuildContext context) => NewAddress(),
	//'/orders': (BuildContext context) => Orders(),
	//'/account': (BuildContext context) => Account()
};
