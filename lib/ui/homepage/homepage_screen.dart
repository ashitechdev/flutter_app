import 'package:flutter/material.dart';
import 'package:flutter_app/providers/homepage_provider.dart';
import 'package:flutter_app/ui/homepage/homepage_widgets.dart';
import 'package:flutter_app/ui/my_animations/myanimations.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomepageProvider>(context, listen: false).fillLists();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.accessibility_outlined),
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Go to users account")));
          },
        ),
        title: Text(
          "the Aesthetic Shop",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                /// go to Cart
              }),
        ],
      ),
      body: Provider.of<HomepageProvider>(context, listen: true).loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProFadeAndTransformAnimation(
              xBegin: 0,
              yBegin: 100,
              xEnd: 0,
              yEnd: 0,
              opacityDuration: Duration(milliseconds: 1700),
              curveOpacity: Curves.easeIn,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Swiper(
                    autoplay: true,
                    containerHeight: 350,
                    itemHeight: 200,
                    containerWidth: MediaQuery.of(context).size.width * 0.98,
                    itemWidth: MediaQuery.of(context).size.width * 0.95,
                    pagination: SwiperPagination(
                        alignment: Alignment.center,
                        builder: DotSwiperPaginationBuilder(
                            activeColor: Colors.pink,
                            size: 5,
                            activeSize: 8,
                            color: Colors.grey)),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        "${Provider.of<HomepageProvider>(context, listen: false).featuredProducts.elementAt(index).imagePath}",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount:
                        Provider.of<HomepageProvider>(context, listen: false)
                            .featuredProducts
                            .length,
                    layout: SwiperLayout.TINDER,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(10),
                      child: ExploreByCategory()),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //
                  //     ],
                  //   ),
                  // ),
                  RandomProductsGrid(
                    title: "Skin Care",
                    rightAlignment: true,
                    items: Provider.of<HomepageProvider>(context, listen: false)
                        .skinProducts,
                  ),
                  RandomProductsGrid(
                    title: "Clothing",
                    rightAlignment: false,
                    items: Provider.of<HomepageProvider>(context, listen: false)
                        .clothingProducts,
                  ),
                  RandomProductsGrid(
                      title: "Jewellery",
                      rightAlignment: true,
                      items:
                          Provider.of<HomepageProvider>(context, listen: false)
                              .jewelleryProducts),
                  RandomProductsGrid(
                    title: "Accessories",
                    rightAlignment: false,
                    items: Provider.of<HomepageProvider>(context, listen: false)
                        .accessoryProducts,
                  ),
                ],
              ),
            ),
    );
  }
}
