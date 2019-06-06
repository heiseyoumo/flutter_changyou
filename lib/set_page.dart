import 'package:flutter/material.dart';

class SetWidget extends StatefulWidget {
  @override
  State<SetWidget> createState() {
    return _SetWidget();
  }
}

class _SetWidget extends State<SetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "返回主界面",
            style: TextStyle(fontSize: 23, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
