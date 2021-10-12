import 'package:flutter/material.dart';

class FutureBuliderRoute extends StatefulWidget {
  const FutureBuliderRoute({Key key}) : super(key: key);

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
        child: FutureBuilder<String>(
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
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "来自网络的数据");
  }
}
