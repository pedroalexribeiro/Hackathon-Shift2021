import 'package:flutter/material.dart';
import 'package:raven/views.dart';
import 'package:raven/mr_manager.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Raven - Heaven's Courier",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/shops',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/shops': (context) => ShopsView(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/items': (context) => ItemsView(),
        '/checkout': (context) => CheckoutView(),
      },
    );
  }
}
