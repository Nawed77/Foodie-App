import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/login/presentation/pages/login.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Login(),
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome To \nFoodie App',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                child: Lottie.asset(
                  'assets/anims/food-delivery.json',
                  height: 200,
                  width: 200,
                  repeat: true,
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Powered By Nawed Ahmad'),
            ),
          ),
        ],
      ),
    );
  }
}
