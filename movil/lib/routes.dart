import 'package:flutter/material.dart';


import 'pages/new-address.dart';
import 'pages/checkout/address.dart';
import 'pages/cart.dart';
import 'pages/home.dart';
//import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/register.dart';
//import 'pages/checkout.dart';
//import 'pages/cart.dart';
//import 'pages/users/Orders.dart';
import 'pages/users/account.dart';
import 'pages/categories.dart';
import 'pages/help.dart';
import 'pages/alarms/listing.dart';
import 'pages/alarms/new-alarm.dart';
import 'pages/checkout/shipping.dart';
import 'pages/checkout/billing.dart';
import 'pages/checkout/payment.dart';
import 'pages/checkout/order-summary.dart';
import 'pages/users/orders-history.dart';


final appRoutes = <String, WidgetBuilder>{
	'/': (BuildContext context) => Home(),
	'/home': (BuildContext context) => Home(), 
	'/login': (BuildContext context) => Login(),
	'/register': (BuildContext context) => Register(),
	//'/checkout': (BuildContext context) => Checkout(),
	'/cart': (BuildContext context) => Cart(),
	'/checkout/address': (BuildContext context) => Address(),
	'/new-address': (BuildContext context) => NewAddress(),
	'/checkout/shipping': (BuildContext context) => Shipping(),
	'/checkout/billing': (BuildContext context) => Billing(),
	'/checkout/payment': (BuildContext context) => Payment(),
	'/checkout/summary': (BuildContext context) => OrderSummary(),
	'/orders': (BuildContext context) => OrdersHistory(),
	'/account': (BuildContext context) => Account(),
	'/categories': (BuildContext context) => Categories(),
	'/help': (BuildContext context) => Help(),
	'/alarms': (BuildContext context) => Alarms(),
	'/alarms/new': (BuildContext context) => NewAlarm(),
};
