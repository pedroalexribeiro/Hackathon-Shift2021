import 'package:flutter/material.dart';
import 'package:raven/mr_manager.dart';
import 'package:raven/theme_colors.dart';
import 'package:raven/views.dart';
import 'package:raven/mr_manager.dart';

void main() {
  MrManager mr = MrManager();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
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
        '/shops': (context) => ShopsView(),
        '/items': (context) => ItemsView(),
        '/checkout': (context) => CheckoutView(),
      },
    );
  }
}
