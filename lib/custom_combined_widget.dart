import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hahah"),
        ),
        body: CustomCombinedWidget(Icons.add, "添加", () {
          print("我是你大爷啊");
        }),
      ),
    );
  }
}

class CustomCombinedWidget extends StatefulWidget {
  IconData iconData;
  String title;
  GestureTapCallback onTap;

  CustomCombinedWidget(this.iconData, this.title, this.onTap);

  @override
  State<CustomCombinedWidget> createState() {
    return CustomCombinedWidgetState();
  }
}

class CustomCombinedWidgetState extends State<CustomCombinedWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: <Widget>[
          Icon(
            widget.iconData,
            size: 45,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
