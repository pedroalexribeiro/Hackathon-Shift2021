class Enterprise {

  final String name;
  final String imageUrl;
  final List<Item> items;
  
  Enterprise({this.name, this.imageUrl, this.items});

}

class Item {

  final String name;
  final String imageUrl;

  Item({this.name, this.imageUrl});

}

class Items {

  final Item item;
  final int quantity;

  Items({this.item, this.quantity});

}