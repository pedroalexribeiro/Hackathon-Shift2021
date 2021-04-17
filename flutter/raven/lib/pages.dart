import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:raven/db_manager.dart';
import 'package:raven/models.dart';
import 'package:raven/partials.dart';

class ShopsPage extends StatefulWidget {

  List<Enterprise> shops = [];

  ShopsPage({Key key}) {

    shops = [
      Enterprise(
        name: 'Continente',
        imageUrl: 'https://plasticoresponsavel.continente.pt/wp-content/uploads/2019/04/IMG_8383.jpg'
      ),

      Enterprise(name: 'Jaquim')
    ];

  }

  @override
  _ShopsPage createState() => _ShopsPage();
}

class _ShopsPage extends State<ShopsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Raven - Heaven's Courier"),
      ),
      body: Column(
        children: [
          
          TextButton(
            child: Text("Send request"),
            onPressed: () async {
                Response response = await DBManager().getInfo();
                debugPrint(response.body);
              },
          ),

          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.shops.length,
            itemBuilder: (context, index) {
              return ListViewRow(
                title: widget.shops[index].name,
                imageUrl: widget.shops[index].imageUrl,
              );
            },
          )

        ],
      )
      );
  }
}

class ItemsPage extends StatefulWidget {

  List<Item> items = [];

  ItemsPage({Key key}) {

    items = [
      Item(
        name: 'bread',
        imageUrl: 'https://pics.clipartpng.com/Bread_PNG_Clip_Art-2218.png'
      ),
    ];

  }

  @override
  _ItemsPage createState() => _ItemsPage();
}

class _ItemsPage extends State<ItemsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Buy"),
      ),
      body: Column(
        children: [

          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return ListViewRow(
                title: widget.items[index].name,
                imageUrl: widget.items[index].imageUrl,
              );
            },
          )

        ],
      )
      );
  }
}