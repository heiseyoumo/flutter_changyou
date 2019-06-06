import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  var title;

  DiscoverPage(this.title);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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
