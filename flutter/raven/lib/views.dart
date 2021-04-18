import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:raven/db_manager.dart';
import 'package:raven/models.dart';
import 'package:raven/mr_manager.dart';
import 'package:raven/partials.dart';
import 'package:raven/theme_colors.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key});

  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            )
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: TextButton(
                child: Text("Login",
                  style: TextStyle(color: ThemeColors.light),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.dark)),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/shops',
                  );
                },
              )
            ),
          )

        ],
      )
    );
  }
}

class ShopsView extends StatefulWidget {
  final MrManager mr;

  ShopsView({this.mr});

  @override
  _ShopsView createState() => _ShopsView();
}

class _ShopsView extends State<ShopsView> {
  List<Enterprise> shops = [];

  @override
  void initState() {
    super.initState();
    shops = [
      Enterprise(
          name: 'Continente',
          imageUrl:
              'https://plasticoresponsavel.continente.pt/wp-content/uploads/2019/04/IMG_8383.jpg'),
      Enterprise(name: 'Jaquim')
    ];
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
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return ListViewRow(
                  title: shops[index].name,
                  imageUrl: shops[index].imageUrl,
                  callback: goToItems);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/checkout',
            arguments: CheckoutView(mr: widget.mr),
          );
        },
        child: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.green,
      ),
    );
  }

  void goToItems() {
    Navigator.pushNamed(
      context,
      '/items',
      arguments: CheckoutView(mr: widget.mr),
    );
  }
}

class ItemsView extends StatefulWidget {
  final MrManager mr;

  ItemsView({this.mr});

  @override
  _ItemsView createState() => _ItemsView();
}

class _ItemsView extends State<ItemsView> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      Item(
          name: 'bread',
          imageUrl:
              'https://thecreativecrops.com/wp-content/uploads/2018/06/01_breadRoll_semmel02_p01.jpg'),
    ];
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListViewRow(
                  title: items[index].name,
                  imageUrl: items[index].imageUrl,
                );
              },
            )
          ],
        ));
  }
}

class CheckoutView extends StatefulWidget {
  final MrManager mr;

  CheckoutView({this.mr});

  @override
  _CheckoutView createState() => _CheckoutView();
}

class _CheckoutView extends State<ItemsView> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListViewRow(
                  title: items[index].name,
                  imageUrl: items[index].imageUrl,
                );
              },
            )
          ],
        ));
  }
}
