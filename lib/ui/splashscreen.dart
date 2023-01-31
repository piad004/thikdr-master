import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login/login.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  static String get routeName => '@routes/welcome-page';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  static String get routeName => '@routes/home-page';
  late AnimationController _scaleController;

  bool hide = false;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginPage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image(image: AssetImage('assets/images/logo.png')),
          ),
        ),
      ),
    );
  }
}