import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/productModel.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SpecificCategoryItems extends StatefulWidget {
  final List<Product> products;
  final String title;
  SpecificCategoryItems({this.products, this.title});

  @override
  _SpecificCategoryItemsState createState() => _SpecificCategoryItemsState();
}

class _SpecificCategoryItemsState extends State<SpecificCategoryItems> {
  bool listView = true;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                child: IconButton(
                    icon: listView ? Icon(Icons.grid_view) : Icon(Icons.list),
                    onPressed: () {
                      setState(() {
                        listView = !listView;
                      });
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 0),
                child: Text(
                  " " + widget.title,
                  textAlign: TextAlign.left,
                  textScaleFactor: 2.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: Center(
                child: Center(
                  child: listView
                      ? AnimationLimiter(
                          child: ListView.builder(
                            padding: EdgeInsets.all(_w / 30),
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: widget.products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                delay: Duration(milliseconds: 100),
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 2500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: FadeInAnimation(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: Duration(milliseconds: 2500),
                                    child: Container(
                                      height: 150,
                                      width: _w * 0.88,
                                      padding: EdgeInsets.all(0),
                                      margin: EdgeInsets.only(bottom: _w / 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 40,
                                            spreadRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(widget
                                                        .products[index]
                                                        .imagePath),
                                                    fit: BoxFit.cover),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                          Flexible(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 25),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.products[index].name,
                                                    textScaleFactor: 1.4,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    widget.products[index]
                                                        .description,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : AnimationLimiter(
                          child: GridView.count(
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.all(_w / 60),
                            crossAxisCount: 2,
                            children: List.generate(
                              49,
                              (int index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: Duration(milliseconds: 500),
                                  columnCount: 2,
                                  child: ScaleAnimation(
                                    duration: Duration(milliseconds: 900),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: _w / 30,
                                            left: _w / 60,
                                            right: _w / 60),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 40,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
