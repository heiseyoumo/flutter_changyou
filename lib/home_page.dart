import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var title;

  HomePage(this.title);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 23),
        ),
      ),
    );
  }
}
