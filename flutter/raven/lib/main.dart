import 'package:flutter/material.dart';
import 'package:raven/mr_manager.dart';
import 'package:raven/theme_colors.dart';
import 'package:raven/views.dart';

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
        primaryColor: ThemeColors.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/shops': (context) => ShopsView(mr: mr),
        '/checkout': (context) => CheckoutView(mr: mr),
        '/start-trip': (context) => DroneTakeOffView()
      },
    );
  }
}
