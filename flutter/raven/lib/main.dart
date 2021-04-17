import 'package:flutter/material.dart';
import 'package:raven/mr_manager.dart';
import 'package:raven/views.dart';
import 'package:raven/mr_manager.dart';

void main() {
  MrManager mr = MrManager();

  runApp(MainApp(mr: mr));
}

class MainApp extends StatelessWidget {
  final MrManager mr;
  MainApp({this.mr});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Raven - Heaven's Courier",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/shops': (context) => ShopsView(mr: mr),
        '/items': (context) => ItemsView(mr: mr),
        '/checkout': (context) => CheckoutView(mr: mr),
      },
    );
  }
}
