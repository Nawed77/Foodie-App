import 'package:flutter/material.dart';
import 'package:food_delivery/color/colors.dart';
import 'package:food_delivery/item_details/presentation/model/item_model.dart';
import 'package:food_delivery/order_confirm/presentation/pages/order_confirm.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var _currentCount = 1;
  List<ItemModel> singleItem = [
    ItemModel(
        img: 'assets/images/delicious-donuts.png',
        name: 'Delicious Donuts',
        price: 'Rs 350'),
    ItemModel(
        img: 'assets/images/chese-burger.png',
        name: 'Cheese Burger',
        price: 'Rs 200'),
    ItemModel(
        img: 'assets/images/italian-pizza.png',
        name: 'Italian Pizza',
        price: 'Rs 400'),
    ItemModel(
        img: 'assets/images/mixed-sushi.png',
        name: 'Mixed Sushi',
        price: 'Rs 250'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            '4 towards at cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
        height: double.infinity,
        child: Stack(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, position) {
                return Container(
                  height: 100,
                  margin: EdgeInsets.only(right: 4, left: 4, bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        singleItem[position].img,
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            singleItem[position].name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            singleItem[position].price,
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _increment();
                            },
                            child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Icon(
                                  Icons.add,
                                )),
                          ),
                          Text(
                            _currentCount.toString(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              _decrement();
                            },
                            child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Icon(Icons.remove)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderConfirm()));
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'Total Rs 1200',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
    });
  }

  void _decrement() {
    setState(() {
      if (_currentCount > 1) {
        _currentCount--;
      }
    });
  }
}
