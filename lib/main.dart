import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/SearchProvider.dart';
import 'Providers/CartProvider.dart';
import 'Providers/SessionProvider.dart';
import 'colors.dart' as colors;
import 'routes.dart' as routes;

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SessionProvider()),
            ChangeNotifierProvider(create: (_) => SearchProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colors.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes.appRoutes,
      initialRoute: '/',
    );
  }
}