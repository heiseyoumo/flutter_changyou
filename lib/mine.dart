import 'dart:async';
import 'package:flutter/material.dart';
import 'main_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() {
    return new _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  int countDown = 3;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countDown--;
        if (countDown == 0) {
          timer.cancel();
          goToMainPage();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void goToMainPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => BottomNavigationWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          new ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: new Image.asset(
              "asset/images/splash.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: GestureDetector(
              onTap: () {
                timer.cancel();
                goToMainPage();
              },
              child: Container(
                alignment: Alignment.center,
                width: 60.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Color(0x44000000),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "跳过" + countDown.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
