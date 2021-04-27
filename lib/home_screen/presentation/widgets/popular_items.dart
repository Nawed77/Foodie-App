import 'package:flutter/material.dart';
import 'package:food_delivery/color/colors.dart';

import 'package:food_delivery/item_details/presentation/pages/items.dart';

class PopularItems extends StatefulWidget {
  final String img;
  final String name;
  final String price;

  const PopularItems({this.img, this.name, this.price});
  @override
  _PopularItemsState createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0, right: 10, left: 10),
      height: 200,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Image.asset(
            widget.img,
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 5.0,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(widget.name, style: TextStyle(fontSize: 14))),
          SizedBox(
            height: 5.0,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(widget.price,
                  style: TextStyle(color: themeColor, fontSize: 14))),
          Spacer(),
          Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Items(
                              img: widget.img,
                              name: widget.name,
                              price: widget.price)));
                },
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    )),
              )),
        ],
      ),
    );
  }
}
