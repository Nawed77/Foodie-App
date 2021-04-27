import 'package:flutter/material.dart';
import 'package:food_delivery/cart/presentation/pages/cart.dart';
import 'package:food_delivery/color/colors.dart';

class Items extends StatefulWidget {
  final String img;
  final String name;
  final String price;

  const Items({this.img, this.name, this.price});
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0.0,
        actions: [
          Container(
            height: 20,
            width: 40,
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(right: 10, top: 3, bottom: 2),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
                child: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )),
          )
        ],
      ),
      body: Container(
        height: double.maxFinite,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.69,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 110),
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.price,
                                style: TextStyle(
                                  color: themeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                width: 95,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: themeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse,
                                      color: Colors.white,
                                    ),
                                    Text('30 min',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 70,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: themeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ),
                                    Text('4.5',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'In additon to the fresh Fast Food.These are addon with chicken,salat,cheese and tomatoes.this is a crispy food you woul love to eat as evening diet.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  wordSpacing: 2.0,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cart()));
                          },
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: themeColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Image(
                      height: 180,
                      width: 180,
                      image: AssetImage(
                        widget.img,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
