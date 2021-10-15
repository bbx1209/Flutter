

import 'package:flutter/material.dart';
import 'package:flutter_news_app/Section/Gesture/MyNoticication.dart';

class CustonNotifyRoute extends StatefulWidget {
  const CustonNotifyRoute({Key? key}) : super(key: key);

  @override
  _CustonNotifyRouteState createState() => _CustonNotifyRouteState();
}

class _CustonNotifyRouteState extends State<CustonNotifyRoute> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustonNotifyRoute"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification){
          setState(() {
            _msg+=notification.msg+"  ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (cnt){
                  return ElevatedButton(onPressed: (){
                    MyNotification("one notification").dispatch(cnt);
                  }, child: Text("send Notofication"));
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}
