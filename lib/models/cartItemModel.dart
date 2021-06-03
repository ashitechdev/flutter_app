import 'package:flutter_app/models/productModel.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({this.product, this.quantity = 1});

  increaseQuantity() {
    quantity = quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }
}
