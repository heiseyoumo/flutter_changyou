import 'package:flutter/material.dart';
import 'package:flutter_changyou/shared_preference.dart';

import 'common_dialog.dart';

class FeedbackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("反馈"),
        ),
        body: FeedbackContent(),
      ),
    );
  }
}

class FeedbackContent extends StatefulWidget {
  @override
  State<FeedbackContent> createState() {
    return _FeedbackContent();
  }
}

class _FeedbackContent extends State<FeedbackContent> {
  SharedPreferencesDataUtils sharedPreferencesDataUtils =
      new SharedPreferencesDataUtils();

  String userName = "";
  int userAge = 0;
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              showDialog<Null>(
                  context: context, //BuildContext对象
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return MessageDialog(
                      title: "标题",
                      message: "消息内容",
                      negativeText: "取消",
                      positiveText: "确定",
                      onCloseEvent: () {
                        Navigator.pop(context);
                      },
                      onPositivePressEvent: () {},
                    );
                  });
            },
            child: Text(
              "弹出自定义的对话框",
              style: TextStyle(fontSize: 23, color: Colors.red),
            ),
          ),
          RaisedButton(
            onPressed: () {
              sharedPreferencesDataUtils.setUserInfo(
                  "name", "彭宽旺" + count.toString());
              sharedPreferencesDataUtils.setUserInfo("age", 213 + count++);
            },
            child: Text(
              "保存数据",
              style: TextStyle(fontSize: 23, color: Colors.red),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                Future<dynamic> name =
                    sharedPreferencesDataUtils.getUserInfo("name");
                name.then((dynamic nameValue) {
                  userName = nameValue;
                });
                Future<dynamic> age =
                    sharedPreferencesDataUtils.getUserInfo("age");
                age.then((dynamic ageValue) {
                  userAge = ageValue;
                });
              });
            },
            child: Text(
              "读取数据",
              style: TextStyle(fontSize: 23, color: Colors.red),
            ),
          ),
          RaisedButton(
            onPressed: () {
              sharedPreferencesDataUtils.deleteUserInfo("name");
              sharedPreferencesDataUtils.deleteUserInfo("age");
            },
            child: Text(
              "删除数据",
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("姓名:" + "$userName"),
                Text("年龄:" + "$userAge")
              ],
            ),
          )
        ],
      ),
    );
  }
}
