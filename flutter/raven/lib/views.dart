import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:raven/db_manager.dart';
import 'package:raven/models.dart';
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
  List<Enterprise> shops = [];

  ShopsView({Key key}) {
    shops = [
      Enterprise(
          name: 'Continente',
          imageUrl:
              'https://plasticoresponsavel.continente.pt/wp-content/uploads/2019/04/IMG_8383.jpg'),
      Enterprise(name: 'Jaquim')
    ];
  }

  @override
  _ShopsView createState() => _ShopsView();
}

class _ShopsView extends State<ShopsView> {
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
                    callback: goToItems);
              },
            )
          ],
        )
      );
  }

  void goToItems() {
    Navigator.pushNamed(
      context,
      '/items',
      //arguments: PokemonArgs(pokemon),
    );
  }
}

class ItemsView extends StatefulWidget {
  List<Item> items = [];

  ItemsView({Key key}) {
    items = [
      Item(
          name: 'bread',
          imageUrl:
              'https://thecreativecrops.com/wp-content/uploads/2018/06/01_breadRoll_semmel02_p01.jpg'),
    ];
  }

  @override
  _ItemsView createState() => _ItemsView();
}

class _ItemsView extends State<ItemsView> {
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
        ));
  }
}

class CheckoutView extends StatefulWidget {
  List<Item> items = [];

  CheckoutView({Key key}) {
    items = [
      Item(
          name: 'bread',
          imageUrl:
              'https://thecreativecrops.com/wp-content/uploads/2018/06/01_breadRoll_semmel02_p01.jpg'),
    ];
  }

  @override
  _CheckoutView createState() => _CheckoutView();
}

class _CheckoutView extends State<ItemsView> {
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
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListViewRow(
                  title: widget.items[index].name,
                  imageUrl: widget.items[index].imageUrl,
                );
              },
            )
          ],
        ));
  }
}
