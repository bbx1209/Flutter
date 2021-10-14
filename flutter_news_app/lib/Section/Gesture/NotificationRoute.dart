import 'package:flutter/material.dart';

class NotifyRoute extends StatefulWidget {
  const NotifyRoute({Key key}) : super(key: key);

  @override
  _NotifyRouteState createState() => _NotifyRouteState();
}

class _NotifyRouteState extends State<NotifyRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotifyRoute"),
      ),
      body: NotificationListener(
        onNotification: (not) {
          switch (not.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("结束滚动");
              break;
            case OverscrollNotification:
              print("滚到边界了");
              break;
          }
          return true;
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          itemCount: 50,
        ),
      ),
    );
  }
}

class NotifyRouteII extends StatelessWidget {
  const NotifyRouteII({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotifyRouteII"),
      ),
      body: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
        print("ScrollEndNotification end ++++");
        return false;
      }, child: ListView.builder(itemBuilder: (context, index) {
        return ListTile(title: Text("$index"));
      })),
    );
  }
}
