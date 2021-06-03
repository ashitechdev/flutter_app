class Product {
  final String name;
  final Category category;
  final String description;
  final double price;
  final double discountedPrice;
  final String imagePath;

  Product(
      {this.imagePath,
      this.name,
      this.category,
      this.description,
      this.price,
      this.discountedPrice});
}

enum Category { skin, clothing, accessory, jewellery }
