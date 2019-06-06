import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPwdPage extends StatefulWidget {
  @override
  State<ResetPwdPage> createState() {
    return _ResetPwdPage();
  }
}

class _ResetPwdPage extends State<ResetPwdPage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("重置密码"),
      ),
      body: Container(
        width: _width,
        padding: EdgeInsets.fromLTRB(40, 31, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "重置密码",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
              child: Text(
                "20位数字与字母组合",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0x66000000),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "请输入手机号码",
                  labelText: "用户名",
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  hintStyle: TextStyle(color: Color(0xCC000000), fontSize: 12),
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "输入验证码",
                  labelText: "验证码",
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  hintStyle: TextStyle(color: Color(0xCC000000), fontSize: 12),
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "输入密码",
                  labelText: "密码",
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      "images/icon_close_eye.png",
                      height: 16,
                      width: 16,
                    ),
                    onPressed: () {
                      print("点我干嘛");
                    },
                  ),
                  hintStyle: TextStyle(color: Color(0xCC000000), fontSize: 12),
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
              ),
            ),
            new Builder(builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  )),
                  height: 44,
                  color: Color(0xFFFFC922),
                  minWidth: _width,
                  onPressed: () {
                    var snackBar = SnackBar(
                      content: Text("点击确定按钮"),
                      duration: new Duration(seconds: 3),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    "确定",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
