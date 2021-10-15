import 'package:flutter/material.dart';

class FutureBuliderRoute extends StatefulWidget {
  const FutureBuliderRoute({Key? key}) : super(key: key);

  @override
  _FutureBuliderRouteState createState() => _FutureBuliderRouteState();
}

class _FutureBuliderRouteState extends State<FutureBuliderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuliderRoute"),
      ),
      body: Center(
          child: Column(
        children: [
          FutureBuilder<String>(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text("contents: ${snapshot.data}");
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          StreamBuilder(
              stream: counter(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("没有 stream");
                  case ConnectionState.waiting:
                    return Text("等待数据");
                  case ConnectionState.active:
                    return Text("actice : ${snapshot.data}");
                  case ConnectionState.done:
                    return Text("stream 已关闭");
                }
              })
        ],
      )),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "来自网络的数据");
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
