import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:raven/db_manager.dart';

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
      home: MainPage(),
    );
  }

}

class MainPage extends StatefulWidget {

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Fuck you."),
      ),
      body: TextButton(
        child: Text("Send request"),
        onPressed: () async {
            Response response = await DBManager().getInfo();
            debugPrint(response.body);
          },
      ),);
  }
}

class Enterprises {
  final String name;

  Enterprises(this.name);

  Enterprises.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
