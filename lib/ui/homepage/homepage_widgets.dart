import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/productModel.dart';
import 'package:flutter_app/providers/homepage_provider.dart';
import 'package:flutter_app/ui/my_animations/myanimations.dart';
import 'package:flutter_app/ui/specific_category_products.dart';
import 'package:provider/provider.dart';

class ExploreByCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<HomepageProvider>(context, listen: false);
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.all(11.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white70)),
            child: Container(
              margin: EdgeInsets.only(top: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageScaleTransition(
                          SpecificCategoryItems(
                              products: data.skinProducts,
                              title: "Skin Care Products :")));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      foregroundImage:
                          AssetImage("assets/categories/face_care.png"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageScaleTransition(
                          SpecificCategoryItems(
                              products: data.clothingProducts,
                              title: "Clothing Products :")));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      foregroundImage:
                          AssetImage("assets/categories/clothing.png"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageScaleTransition(
                          SpecificCategoryItems(
                              products: data.jewelleryProducts,
                              title: "Jewellery Products :")));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      foregroundImage:
                          AssetImage("assets/categories/jewellery.png"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageScaleTransition(
                          SpecificCategoryItems(
                              products: data.accessoryProducts,
                              title: "Accessories :")));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      foregroundImage:
                          AssetImage("assets/categories/accessory.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 10,
              left: 10,
              child: SizedBox(
                child: Container(
                  child: Text(
                    " Explore by Category ",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      backgroundColor: ThemeData.dark().canvasColor,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class RandomProductsGrid extends StatelessWidget {
  final bool rightAlignment;
  final String title;
  final List<Product> items;

  RandomProductsGrid({this.rightAlignment, this.title, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.all(11.5),
            padding: EdgeInsets.only(top: 25, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white70)),
            child: Container(
              margin: EdgeInsets.all(5),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.all(3),
                      child: GridTile(
                        footer: Container(
                            decoration: BoxDecoration(color: Colors.black87),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(items.elementAt(index + 2).name),
                            )),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white12,
                                    blurRadius: 0.5,
                                    spreadRadius: 1),
                              ],
                              image: DecorationImage(
                                  image: AssetImage(items[index + 2].imagePath),
                                  fit: BoxFit.cover)),
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
              top: 0,
              right: rightAlignment ? null : 25,
              left: rightAlignment ? 25 : null,
              child: SizedBox(
                child: Container(
                  child: Text(
                    " $title ",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      backgroundColor: ThemeData.dark().canvasColor,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
