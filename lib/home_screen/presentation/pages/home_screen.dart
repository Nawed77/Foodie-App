import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/color/colors.dart';
import 'package:food_delivery/home_screen/presentation/model/categories_model.dart';
import 'package:food_delivery/home_screen/presentation/widgets/popular_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<CategoryModel> singleItem = [
    CategoryModel(
      img: 'assets/images/burger.png',
      name: 'All',
    ),
    CategoryModel(
      img: 'assets/images/donuts.png',
      name: 'Donuts',
    ),
    CategoryModel(
      img: 'assets/images/pizza.png',
      name: 'Pizza',
    ),
    CategoryModel(
      img: 'assets/images/lollipop.png',
      name: 'Lolipop',
    ),
    CategoryModel(
      img: 'assets/images/donuts.png',
      name: 'Donuts',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.menu),
          Icon(Icons.search),
          Icon(
            Icons.home,
          ),
          Icon(Icons.settings),
          Icon(Icons.account_circle),
        ],
        backgroundColor: themeColor,
        buttonBackgroundColor: Colors.white,
        color: Colors.white,
        index: 2,
        onTap: (index) {},
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 40),
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: themeColor,
                        border: Border.all(width: 1.0, color: themeColor),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                            image: AssetImage(
                          'assets/images/boy.png',
                        ))),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search)),
                  )),
              Container(
                height: 120,
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = position;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            margin: EdgeInsets.only(
                                right: 3.0, left: 4.0, bottom: 2.0),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: selectedIndex == position
                                  ? themeColor
                                  : Colors.blueGrey[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Image.asset(
                              singleItem[position].img,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        Text(
                          singleItem[position].name,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
                  },
                  itemCount: singleItem.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Popular',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: PopularItems(
                          img: 'assets/images/chese-burger.png',
                          name: 'Cheese Burger',
                          price: 'Rs 200')),
                  Expanded(
                      child: PopularItems(
                          img: 'assets/images/delicious-donuts.png',
                          name: 'Delicious Donuts',
                          price: 'Rs 350'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: PopularItems(
                          img: 'assets/images/italian-pizza.png',
                          name: 'Italian Pizza',
                          price: 'Rs 400')),
                  Expanded(
                      child: PopularItems(
                          img: 'assets/images/mixed-sushi.png',
                          name: 'Mixed Sushi',
                          price: 'Rs 250'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
