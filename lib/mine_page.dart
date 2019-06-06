import 'package:flutter/material.dart';
import 'common_dialog.dart';
import 'reset_pwd_page.dart';
import 'set_page.dart';
import 'feedback_page.dart';

class MinePage extends StatefulWidget {
  var title;

  MinePage(this.title);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "我的",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.yellow,
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    height: 40,
                    child: Image.asset(
                      "asset/images/no_message.png",
                      height: 28,
                      width: 28,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "asset/images/ic_personal_head.png",
                          height: 46,
                          width: 46,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("昵称是黑色幽默"),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2F2F2F),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(13, 4, 13, 4),
                            child: Text(
                              "签到领积分",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xffFFC922),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 16,
                          color: Color(0xFFFFC90A),
                          width: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("我的订单"),
                        ),
                        GestureDetector(
                          child: Text(
                            "所有订单",
                            style: TextStyle(color: Color(0x66000000)),
                          ),
                          onTap: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("点击所有订单"),
                              duration: Duration(milliseconds: 300),
                            ));
                          },
                        ),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Image.asset("asset/images/wait_pay.png",
                                  height: 26, width: 26),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child:
                                    Text("待付款", style: TextStyle(fontSize: 14)),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Image.asset("asset/images/wait_pay.png",
                                  height: 26, width: 26),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child:
                                    Text("待发货", style: TextStyle(fontSize: 14)),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Image.asset("asset/images/wait_pay.png",
                                  height: 26, width: 26),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child:
                                    Text("待收货", style: TextStyle(fontSize: 14)),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Image.asset("asset/images/wait_pay.png",
                                  height: 26, width: 26),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text("退货退款",
                                    style: TextStyle(fontSize: 14)),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MineBottomList()
          ],
        ),
      ),
    );
  }
}

class MineBottomList extends StatelessWidget {
  Widget getBottomContainer(context, url, content) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 60,
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Image.network(
              url,
              height: 26,
              width: 26,
            ),
            Text(content)
          ],
        ),
        onTap: () {
          if (content == "设置") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new SetWidget()));
          } else if (content == "反馈") {
            navigationToFeedback(context);
          } else if (content == "弹出对话框") {
            showDialog<Null>(
                context: context,
                /*属性代表点击顶部状态栏(显示电量/时间的横条位置)时是否关闭对话框，如果想点击半透明位置时关闭对话框，可以再添加一个点击事件即可*/
                barrierDismissible: false,
                builder: (context) {
                  return MessageDialog(
                    title: "标题",
                    message:
                        "确认删确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗确认删除吗除吗",
                    negativeText: "取消",
                    positiveText: "确定",
                    onCloseEvent: () {
                      Navigator.pop(context);
                    },
                    onPositivePressEvent: () {},
                  );
                });
          } else if (content == "重置密码") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new ResetPwdPage()));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          getBottomContainer(
            context,
            "http://test-m-stg.ppppoints.com/uploadimage/IMG20180620192011420.png",
            "弹出对话框",
          ),
          Container(
            color: Color(0xFFEEEEEE),
            height: 0.5,
          ),
          getBottomContainer(
            context,
            "http://test-m-stg.ppppoints.com/uploadimage/IMG20180620192011420.png",
            "反馈",
          ),
          Container(
            color: Color(0xFFEEEEEE),
            height: 0.5,
          ),
          getBottomContainer(
            context,
            "http://test-m-stg.ppppoints.com/uploadimage/IMG20180620192106776.png",
            "设置",
          ),
          Container(
            color: Color(0xFFEEEEEE),
            height: 0.5,
          ),
          getBottomContainer(
            context,
            "https://test-m-stg.ppppoints.com/uploadimage/IMG20180620192027300.png",
            "重置密码",
          ),
        ],
      ),
    );
  }

  void navigationToFeedback(context) async {
    final result = await Navigator.push(
        context, new MaterialPageRoute(builder: (context) => FeedbackWidget()));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}
