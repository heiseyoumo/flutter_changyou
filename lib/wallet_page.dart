import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WalletPage extends StatefulWidget {
  var title;

  WalletPage(this.title);

  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
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
