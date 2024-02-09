import 'dart:async';

import 'package:flutter/material.dart';

import '../bottomNavPage.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  _navigateToNextPage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => BottomNavPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Stack(
          children: [
            Image.asset('assets/splash_background.png', fit: BoxFit.cover, width: MediaQuery
                .of(context)
                .size
                .width,),

            Positioned.fill(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: Image.asset('assets/logo.png')),
            Positioned.fill(
                bottom: 0,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/splash_bottom.png'))),
          ],
        ),
      ),
    );
  }

}
