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
            padding: EdgeInsets.only(bottom: 64),
            child: Image(
              image: AssetImage('assets/icon1.png'),
              width: 128,
            ),
          ),

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
        imageUrl: 'https://plasticoresponsavel.continente.pt/wp-content/uploads/2019/04/IMG_8383.jpg',
        items: [
          Item(
            name: 'Pão',
            imageUrl: 'https://p.kindpng.com/picc/s/72-722801_bread-roll-png-roll-of-bread-png-transparent.png'
          ),
          
          Item(
            name: 'Cenoura',
            imageUrl: 'http://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c20a.png'
          ),

          Item(
            name: 'Pêra',
            imageUrl: 'https://i.pinimg.com/originals/57/fb/26/57fb2679c1c72f5acc407bbc1b8223bc.jpg'
          ),

        ]
      ),

      Enterprise(
        name: 'Pingo Doce',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/d/de/Pingo_Doce_logo.svg/1280px-Pingo_Doce_logo.svg.png',
        items: [
          Item(
            name: 'Vinho',
            imageUrl: 'https://mpng.subpng.com/20190302/cgk/kisspng-red-wine-white-wine-vector-graphics-stock-photogra-5c7afbe7c7ef26.6296861815515637518189.jpg'
          ),

          Item(
            name: 'Bolachas',
            imageUrl: 'https://img.lovepik.com/element/40052/6071.png_860.png'
          ),
        ]
      ),

      Enterprise(
        name: 'Farmacia',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Sigl%C4%83farmacii.png/224px-Sigl%C4%83farmacii.png',
        items: [
          Item(
            name: 'Ben-u-ron',
            imageUrl: 'https://www.afarmaciaonline.pt/uploads/5440987.jpg'
          ),
          Item(
            name: 'Brufen',
            imageUrl: 'https://www.brufen.pt/-/media/brufenpt/images/brufen_400mg_20_comprimidos_2.png'
          ),
        ]
      ),

      Enterprise(
        name: 'Praxis',
        imageUrl: 'https://media.slbenfica.pt/-/media/benficadp/shop/members/redpower/partners/restaurante-praxis/praxis-logo.png',
        items: [
          Item(
            name: 'Cerveja',
            imageUrl: 'https://i.pinimg.com/736x/38/80/ef/3880ef0538f22dfe20a8e03402944a0f.jpg'
          ),
        ]
      ),

      Enterprise(
        name: 'McDonalds',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/McDonald%27s_SVG_logo.svg/1200px-McDonald%27s_SVG_logo.svg.png',
        items: [
          Item(
            name: 'Hambúrger',
            imageUrl: 'https://i.pinimg.com/originals/37/41/d6/3741d6779bbaf4631c8e01953e621df7.png'
          ),

          Item(
            name: 'Sumo',
            imageUrl: 'https://www.pngfind.com/pngs/m/199-1999370_county-range-apple-juice-200ml-apple-juice-packaging.png'
          ),
        ]
      ),

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
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return ListViewRow(
                  title: shops[index].name,
                  imageUrl: shops[index].imageUrl,
                  callback: () => goToItems(shops[index]),
                );
                  
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

  void goToItems(shop) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemsView(mr: widget.mr, shop: shop),
      ),
    );
  }
}

class ItemsView extends StatefulWidget {
  final MrManager mr;
  final Enterprise shop;

  ItemsView({this.mr, this.shop});

  @override
  _ItemsView createState() => _ItemsView();
}

class _ItemsView extends State<ItemsView> {
  List<Item> items;

  @override
  void initState() {
    super.initState();

    items = widget.shop.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListViewRow(
            title: items[index].name,
            imageUrl: items[index].imageUrl,
            callbackOnAdd: () => addItemToCart(items[index])
          );
        },
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

  void addItemToCart(item) {
    /*final snackBar = SnackBar(
      content: Text('Added ' + item.name + ' to cart'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );*/
    
    widget.mr.addToCart(item);
    
    //ScaffoldMessenger.of(context).showSnackBar(snackBar); // show message
  }
}

class CheckoutView extends StatefulWidget {
  final MrManager mr;

  CheckoutView({this.mr});

  @override
  _CheckoutView createState() => _CheckoutView();
}

class _CheckoutView extends State<CheckoutView> {
  List<Items> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var itemsQuantity = {};
    for(Item item in widget.mr.getItems()) {

      if(itemsQuantity.containsKey(item))
        itemsQuantity[item] += 1;
      else
        itemsQuantity[item] = 1;
    }

    var items = [];
    for(var key in itemsQuantity.keys) {
      items.add(Items(item: key, quantity: itemsQuantity[key]));
      debugPrint("size: ${items.length}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListViewMultipleRow(
                  item: items[index].item,
                  quantity: items[index].quantity,
                );
              },
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/start-trip',
          );          
        },
        child: const Icon(Icons.send),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class DroneTakeOffView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy"),
      ),
      body: Column(
        children: [

          Image(
              image: AssetImage('assets/map.png'),
            ),

          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text("Please deploy the drone in a safe designated space.",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20
                  ),
                ),
              )
            ),
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: TextButton(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text("Start",
                  style: TextStyle(color: ThemeColors.light),
                ),
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.dark)),
              onPressed: () async {
                Response response = await DBManager().getInfo();
                debugPrint(response.body);
              },
            )
          ),


        ],
      ));
  }

}
/*
class DroneTakeOffView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy"),
      ),
      body: Column(
        children: [

          Expanded(
            child: Center(
              child: Icon(
                Icons.check,
                size: 128,
                color: Colors.green,
              )
            )
          ),

          Padding(
            padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
            child: Text("The drone came back from its destination and is ready for pick-up.",
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),

        ],
      ));
  }

}*/