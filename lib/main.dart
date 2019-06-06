import 'package:flutter/material.dart';
import 'package:flutter_changyou/wallet_page.dart';

import 'discover_page.dart';
import 'home_page.dart';
import 'mine_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<BottomNavigationWidget> createState() {
    return _BottomNavigationWidget();
  }
}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  List<Widget> list;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  var _currentIndex = 0;
  var appBottomIcons = [
    ["asset/images/ic_home_normal.png", "asset/images/ic_home_selected.png"],
    [
      "asset/images/ic_discover_normal.png",
      "asset/images/ic_wallet_selected.png"
    ],
    [
      "asset/images/ic_wallet_normal.png",
      "asset/images/ic_wallet_selected.png"
    ],
    ["asset/images/ic_mine_normal.png", "asset/images/ic_mine_selected.png"]
  ];
  var appTitle = ["首页", "发现", "钱包", "我的"];

  Widget getBottomIcons(position) {
    if (_currentIndex == position) {
      return Image.asset(
        appBottomIcons[_currentIndex][1],
        height: 60,
        width: 60,
      );
    }
    return Image.asset(
      appBottomIcons[position][0],
      height: 60,
      width: 60,
    );
  }

  Widget getBottomTitle(position) {
    if (_currentIndex == position) {
      return Text(
        appTitle[_currentIndex],
        style: TextStyle(fontSize: 18, color: Colors.black),
      );
    }
    return Text(
      appTitle[position],
      style: TextStyle(fontSize: 16, color: Colors.black87),
    );
  }

  @override
  void initState() {
    list = new List<Widget>()
      ..add(HomePage("首页"))
      ..add(DiscoverPage("发现"))
      ..add(WalletPage("钱包"))
      ..add(MinePage("我的"));
    super.initState();
  }

  void showSnackBar(message, position) {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text("我是:" + appTitle[position]),
      duration: Duration(seconds: 1),
      action: SnackBarAction(
        label: "点我啊",
        textColor: Colors.red,
        onPressed: () {
          print("我点击了哈哈哈");
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldkey,
        body: list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: getBottomIcons(0),
              title: getBottomTitle(0),
            ),
            BottomNavigationBarItem(
              icon: getBottomIcons(1),
              title: getBottomTitle(1),
            ),
            BottomNavigationBarItem(
              icon: getBottomIcons(2),
              title: getBottomTitle(2),
            ),
            BottomNavigationBarItem(
              icon: getBottomIcons(3),
              title: getBottomTitle(3),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              showSnackBar("我是你大爷啊", index);
            });
          },
        ),
      ),
    );
  }
}
