import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/Merterial/ButtonRoute.dart';
import 'package:flutter_news_app/Section/Merterial/ImageRoute.dart';
import 'package:flutter_news_app/main.dart';
import 'package:toast/toast.dart';

import 'TextRoute.dart';

List<RouteItem> getMertialItems() {
  List<RouteItem> items = [
    RouteItem("TextRoute", TextRoute()),
    RouteItem("ImageRoute", ImageRoute()),
    RouteItem("ButtonRoute", ButtonRoute()),
  ];
  return items;
}

class MerterialRoute extends StatelessWidget {
  MerterialRoute({Key key}) : super(key: key);
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

