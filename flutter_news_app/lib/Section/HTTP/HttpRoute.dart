import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class HTTPRoute extends StatefulWidget {
  const HTTPRoute({Key? key}) : super(key: key);

  @override
  _HTTPRouteState createState() => _HTTPRouteState();
}

class _HTTPRouteState extends State<HTTPRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTPRoute"),
      ),
      body: Column(
        children: [
          TextButton(
            child: Text("http client"),
            onPressed: () {
              httpClientRqueset();
            },
          ),
          TextButton(
            child: Text("dio get"),
            onPressed: () {
              // dioGet();
              dioGetWithParam();
            },
          ),
          TextButton(
            child: Text("dio post"),
            onPressed: () {
              dioPostWithParam();
            },
          ),
          TextButton(
            child: Text("dio post formdata"),
            onPressed: () {
              dioPostWithFormData();
            },
          ),
          Container(
            alignment: Alignment.center,
            child: FutureBuilder(
                future:
                    Dio().get("https://api.github.com/orgs/flutterchina/repos"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //请求完成
                  if (snapshot.connectionState == ConnectionState.done) {
                    Response response = snapshot.data;
                    //发生错误
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    //请求成功，通过项目信息构建用于显示项目名称的ListView
                    print(response.data.toString());
                    return Text("done");
                  }
                  //请求未完成时弹出loading
                  return CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}

httpClientRqueset() async {
  try {
    HttpClient httpClient = HttpClient();
    Uri uri = Uri.parse("https://httpbin.org/get");
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    print(result);
    httpClient.close();
  } catch (e) {
    print("$e");
  } finally {
    print("finally");
  }
}

dioGet() async {
  var dio = Dio();
  Response response = await dio.get("https://httpbin.org/get");
  print(response.data.toString() + response.headers.toString());
}

dioGetWithParam() async {
  var dio = Dio();
  Response response = await dio
      .get("https://httpbin.org/get", queryParameters: {"a": "1", "b": "2"});
  print(response.data.toString() + response.headers.toString());
}

dioPostWithParam() async {
  var dio = Dio();
  Response response =
      await dio.post("https://httpbin.org/post", data: {"a": "1", "b": "2"});
  print(response.data.toString() + response.headers.toString());
}

dioPostWithFormData() async {
  var dio = Dio();
  FormData formData = FormData.fromMap({"name": "weixin", "age": 11});

  Response response =
      await dio.post("https://httpbin.org/post", data: formData);
  print(response.data.toString() + response.headers.toString());
}
