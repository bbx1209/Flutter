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
  Response response = await dio.get("https://httpbin.org/get",queryParameters: {"a":"1","b":"2"});
  print(response.data.toString() + response.headers.toString());
}

