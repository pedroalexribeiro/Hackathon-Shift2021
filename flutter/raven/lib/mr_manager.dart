import 'package:raven/models.dart';

class MrManager {
  List<Item> shoppingCartItems;

  MrManager() {
    shoppingCartItems = [];
  }

  List<Item> getItems() {
    return shoppingCartItems;
  }

  void addToCart(Item item) {
    shoppingCartItems.add(item);
  }

  void removeFromCart(Item item) {
    shoppingCartItems.removeWhere((element) => element.name == item.name);
  }

  void clearCart() {
    shoppingCartItems.clear();
  }
}
