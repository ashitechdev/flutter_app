import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/productModel.dart';

class HomepageProvider with ChangeNotifier {
  List<Product> skinProducts = [];
  List<Product> jewelleryProducts = [];
  List<Product> clothingProducts = [];
  List<Product> accessoryProducts = [];

  List<Product> featuredProducts = [];

  bool _loading = true;

  bool get loading => _loading;

  fillLists() async {
    await Future.delayed(Duration(seconds: 3));

    /// filling skinCareProducts List
    for (int i = 1; i < 11; i++) {
      skinProducts.add(Product(
        imagePath: "assets/skin_care/skin_care ($i).jpg",
        name: "Skin Prod $i",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        category: Category.skin,
        price: getRandomOriginalPrice(),
        discountedPrice: getRandomDiscountedPrice(),
      ));
    }
    print("\nAdded skin care Products\nlength of list :  ");
    print(skinProducts.length.toString());

    /// filling ClothingProducts List
    for (int i = 1; i < 14; i++) {
      clothingProducts.add(Product(
        imagePath: "assets/clothing/clothing ($i).jpg",
        name: "Clothing Prod $i",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        category: Category.clothing,
        price: getRandomOriginalPrice(),
        discountedPrice: getRandomDiscountedPrice(),
      ));
    }
    print("\nAdded clothing care Products\nlength of list :  ");
    print(clothingProducts.length.toString());

    /// filling JewelleryProducts List
    for (int i = 1; i < 14; i++) {
      jewelleryProducts.add(Product(
        imagePath: "assets/jewellery/jewellery ($i).jpg",
        name: "Jewellery Prod $i",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        category: Category.jewellery,
        price: getRandomOriginalPrice(),
        discountedPrice: getRandomDiscountedPrice(),
      ));
    }
    print("\nAdded jewels care Products\nlength of list :  ");
    print(jewelleryProducts.length.toString());

    /// filling AccessoriesProducts List
    for (int i = 1; i < 21; i++) {
      accessoryProducts.add(Product(
        imagePath: "assets/accessories/accessorie ($i).jpg",
        name: "Accessory Prod $i",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        category: Category.accessory,
        price: getRandomOriginalPrice(),
        discountedPrice: getRandomDiscountedPrice(),
      ));
    }
    print("\nAdded skin care Products\nlength of list :  ");
    print(accessoryProducts.length.toString());

    for (int i = 1; i < 4; i++) {
      featuredProducts.addAll([
        skinProducts.elementAt(i),
        clothingProducts.elementAt(i + 1),
        jewelleryProducts.elementAt(i + 2),
        accessoryProducts.elementAt(i + 3),
      ]);
    }

    _loading = false;
    notifyListeners();
  }
}

double getRandomDiscountedPrice() {
  double randomNumberGenerated = 40 + (Random().nextDouble() * 10);
  return double.parse(randomNumberGenerated.toStringAsFixed(1));
}

double getRandomOriginalPrice() {
  double randomNumberGenerated = 55 + (Random().nextDouble() * 10);
  return double.parse(randomNumberGenerated.toStringAsFixed(1));
}
