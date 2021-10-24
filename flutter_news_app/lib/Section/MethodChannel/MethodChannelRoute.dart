import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/Helpers/MethodChannel.dart';

class MethodChannelRoute extends StatefulWidget {
  const MethodChannelRoute({Key? key}) : super(key: key);

  @override
  _MethodChannelRouteState createState() => _MethodChannelRouteState();
}

class _MethodChannelRouteState extends State<MethodChannelRoute> {
  String _infoFromNative = "";
  static const platform = MyMethodChannel.platform;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MethodChannelRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("${_infoFromNative}", style: TextStyle(fontSize: 20)),
            TextButton(
                onPressed: () {
                  setState(() {
                    //更新文本框
                    // _infoFromNative = "message from native";
                    _getInfomationFromNative();
                  });
                },
                child: Text("获取信息")),

          ],
        ),
      ),
    );
  }

  Future<Null> _getInfomationFromNative() async {
    String info;
    String result = await platform.invokeMethod('getInfomationFromNative');
    _infoFromNative = result;
  }
}
