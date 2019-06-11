import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: BodyCenter(),
      ),
    );
  }
}

class BodyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyCenter();
  }
}

class _BodyCenter extends State<BodyCenter> {
  var path = "没有";
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String userName = "";
  String password = "";

  Future getPath() async {
    // 获取应用文档目录并创建文件
    Directory documentsDir = await getApplicationDocumentsDirectory();
    setState(() {
      path = documentsDir.path;
    });
  }

  void submit() {
    var currentState = _formKey.currentState;
    if (currentState.validate()) {
      currentState.save();
      writeToFile("userName", userName);
      writeToFile("password", password);
    }
  }

  Future writeToFile(String key, String info) async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    File file = new File('$documentsPath/$key');
    if (!file.existsSync()) {
      file.createSync();
    }
    File file1 = await file.writeAsString(info);
    if (file1.existsSync()) {
      print("保存成功");
    }
  }

  Future<String> readFile(String key) async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    File file = new File('$documentsPath/$key');
    if (!file.existsSync()) {
      file.createSync();
    }
    String readAsStringSync = file.readAsStringSync();
    return readAsStringSync;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              getPath();
            },
            child: Text("获取文件目录"),
          ),
          Text("目录:$path"),
          Form(
            key: _formKey,
            onChanged: () {
              print("onChanged");
            },
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "请输入用户名",
                  ),
                  validator: (name) {
                    if (name.isEmpty) {
                      return "请输入用户名";
                    }
                    return null;
                  },
                  initialValue: "$userName",
                  onSaved: (name) {
                    this.userName = name;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                  ),
                  validator: (pwd) {
                    if (pwd.length != 6) {
                      return "密码必须是六位";
                    }
                    return null;
                  },
                  initialValue: "$password",
                  onSaved: (pwd) {
                    this.password = pwd;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        _formKey.currentState.reset();
                      },
                      child: Text(
                        "重置",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        submit();
                      },
                      child: Text(
                        "保存到本地",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    onPressed: () {
                      Future<String> s = readFile("userName");
                      s.then((dynamic name) {
                        setState(() {
                          userName = name;
                        });
                      });
                      Future<String> s1 = readFile("password");
                      s1.then((dynamic pwd) {
                        setState(() {
                          password = pwd;
                        });
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      "读取保存在本地的数据",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
