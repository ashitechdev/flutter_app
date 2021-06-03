import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/cartItemModel.dart';

class CartpageProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
