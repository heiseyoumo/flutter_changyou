import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_changyou/shared_preference.dart';

import 'common_dialog.dart';

void main() => runApp(new FeedbackWidget());

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
  var isChecked = false;
  String _character = 'A';
  var isSwitchChecked = false;

  @override
  void initState() {
    Future<dynamic> name = sharedPreferencesDataUtils.getUserInfo("name");
    name.then((dynamic nameValue) {
      setState(() {
        userName = nameValue;
      });
    });
    Future<dynamic> age = sharedPreferencesDataUtils.getUserInfo("age");
    age.then((dynamic ageValue) {
      setState(() {
        userAge = ageValue;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          RaisedButton(
            onPressed: () {
              sharedPreferencesDataUtils.setUserInfo("name", "彭宽旺");
              sharedPreferencesDataUtils.setUserInfo("age", 213);
            },
            child: Text(
              "保存数据",
              style: TextStyle(fontSize: 14, color: Colors.red),
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
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              sharedPreferencesDataUtils.deleteUserInfo("name");
              sharedPreferencesDataUtils.deleteUserInfo("age");
              setState(() {
                userName = "默认";
                userAge = 0;
              });
            },
            child: Text(
              "删除数据",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("姓名:" + "${this.userName}"),
                Text("年龄:" + "${this.userAge}")
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              print("别点我啊");
            },
            color: Colors.red,
            highlightColor: Colors.blue,
            textColor: Colors.white,
            child: Text("MaterialButton别点我"),
          ),
          CupertinoButton(
            onPressed: () {
              print("别点我啊");
            },
            color: Colors.red,
            child: Text("CupertinoButton别点我"),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: true,
                onChanged: (checked) {
                  print(checked);
                },
                tristate: true,
              ),
              Checkbox(
                value: isChecked, // 控件状态值
                onChanged: (checked) {
                  print("checked = $checked");
                  setState(() {
                    // 状态改变后需要通过setState刷新Widget改变状态
                    this.isChecked = checked;
                  });
                },
                activeColor: Colors.blueAccent, // checkbox颜色
              ),
            ],
          ),
          Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Radio<String>(
                  value: "radioA",
                  groupValue: _character,
                  onChanged: (newValue) {
                    setState(() {
                      // 点击当前控件时更新状态
                      _character = newValue;
                    });
                  },
                ),
                Radio<String>(
                  value: "radioB",
                  groupValue: _character,
                  onChanged: (newValue) {
                    setState(() {
                      // 点击当前控件时更新状态
                      _character = newValue;
                    });
                  },
                ),
                Radio<String>(
                  value: "radioC",
                  groupValue: _character,
                  onChanged: (newValue) {
                    setState(() {
                      // 点击当前控件时更新状态
                      _character = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: <Widget>[
                CupertinoSwitch(
                  value: isSwitchChecked,
                  activeColor: Colors.yellow,
                  onChanged: (newValue) {
                    setState(() {
                      this.isSwitchChecked = newValue;
                    });
                  },
                ),
                CupertinoSwitch(
                  value: true,
                ),
                MaterialButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.parse("20181209"),
                      //初始选中日期
                      firstDate: DateTime.parse("20181109"),
                      //可选日期范围第一个日期
                      lastDate: DateTime.parse("20190109"),
                      //可选日期范围最后一个日期
                      selectableDayPredicate: (dateTime) {
                        //通过此方法可以过滤掉可选范围内不可选的特定日期
                        if (dateTime.day == 10 ||
                            dateTime.day == 20 ||
                            dateTime.day == 30) {
                          //此处表示10号、20号、30号不可选
                          return false;
                        }
                        return true;
                      },
                      initialDatePickerMode:
                          DatePickerMode.day, //初始化选择模式，有day和year两种
                    ).then((dateTime) {
                      //选择日期后点击OK拿到的日期结果
                      print(
                          '当前选择了：${dateTime.year}年${dateTime.month}月${dateTime.day}日');
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    "日期选择框",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((timeOfDay) {
                        print(
                            "小小时小时小时小时小时小时时:${timeOfDay.hour},分钟分钟分钟分钟分钟分钟:${timeOfDay.minute}");
                      });
                    },
                    child: Text(
                      "时间选择器",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 140),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text("ios日期选择框"),
                  onPressed: () {},
                  color: Colors.red,
                ),
                MaterialButton(
                  child: Text("ios时间选择框"),
                  onPressed: () {},
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
