import 'dart:_http';
import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              getHttpRequest();
            },
            child: Text("网络请求"),
          ),
        ),
      ),
    );
  }

  Future getHttpRequest() async {
    var httpClient = new HttpClient();
    httpClient.findProxy = (url) {
      return HttpClient.findProxyFromEnvironment(url, environment: {
        "http_proxy": 'http://192.168.124.94:8888',
      });
    };
    //请求参数设置
    Map<String, String> queryParameters = {
      'format': '2',
      'key': '939e592487c33b12c509f757500888b5',
      'lon': '116.39277',
      'lat': '39.933748'
    };
    var uri = Uri.http('v.juhe.cn', '/weather/geo', queryParameters);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == 200) {
      print('请求成功');
      var responseBody = await response.transform(utf8.decoder).join();
      print('responseBody = $responseBody');
    } else {
      print('请求失败');
    }
  }
}
