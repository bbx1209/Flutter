import 'package:flutter/material.dart';
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/Gesture/CustomNotificationRoute.dart';
import 'package:flutter_news_app/Section/Gesture/EventBusRoute.dart';
import 'package:flutter_news_app/Section/Gesture/GestureDetectorRoute.dart';
import 'package:flutter_news_app/Section/Gesture/MoveGestureRoute.dart';
import 'package:flutter_news_app/Section/Gesture/NotificationRoute.dart';
import 'package:flutter_news_app/Section/Gesture/ScaleGestureRoute.dart';
import 'package:toast/toast.dart';

List<RouteItem> getMertialItems() {
  List<RouteItem> items = [
    RouteItem("GestureDetectorRoute", GestureDetectorRoute()),
    RouteItem("MoveGestureRoute", MoveGestureRoute()),
    RouteItem("ScaleGestureRoute", ScaleGestureRoute()),
    RouteItem("EventBusRoute", EventBusRoute()),
    RouteItem("NotifyRoute", NotifyRoute()),
    RouteItem("NotifyRouteII", NotifyRouteII()),
    RouteItem("CustonNotifyRoute", CustonNotifyRoute()),


  ];
  return items;
}



class GestureRoute extends StatefulWidget {
  const GestureRoute({Key? key}) : super(key: key);

  @override
  _GestureRouteState createState() => _GestureRouteState();
}

class _GestureRouteState extends State<GestureRoute> {
  List<RouteItem> items = [];
  @override
  Widget build(BuildContext context) {
    items = getMertialItems();
    return Scaffold(
      appBar: AppBar(
        title: Text("页面元素"),
      ),
      body: Center(
          child: ListView.separated(
            itemBuilder: (BuildContext buildContext, int index) {
              var item = items[index];
              return getItem(context, index, item);
            },
            separatorBuilder: (BuildContext buildContext, int index) {
              return Padding(padding: EdgeInsets.only(left: 25),
                child: Divider(color: Colors.black38,),);
            },
            itemCount: items.length,
          )
      ),
    );
  }

  Widget getItem(BuildContext context, int index, RouteItem item) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text("${item.title}"),
        ),
        height: 45,
        color: Colors.cyan,
      ),
      onTap:(){
        onClickItem(context,item);
      },
    );
  }

  void onClickItem(BuildContext context,RouteItem item) {
    Toast.show("点击了 ${item.title} ", context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return item.newRoute;
    }));
  }
}
