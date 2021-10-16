


import 'package:flutter/material.dart';
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/layoutRoute/FlexRoute.dart';
import 'package:flutter_news_app/Section/layoutRoute/FlowLayoutRoute.dart';
import 'package:flutter_news_app/Section/layoutRoute/StackRoute.dart';
// import 'package:toast/toast.dart';


List<RouteItem> getMertialItems() {
  List<RouteItem> items = [
    RouteItem("FlexRoute", FlexRoute()),
    RouteItem("WrapLayouteRoute", WrapLayouteRoute()),
    RouteItem("FlowLayouteRoute", FlowLayouteRoute()),
    RouteItem("StackRoute", StackRoute()),

  ];
  return items;
}

class LayoutRoute extends StatefulWidget {
  LayoutRoute({Key? key}) : super(key: key);

  @override
  _LayoutRouteState createState() => _LayoutRouteState();
}

class _LayoutRouteState extends State<LayoutRoute> {
  List<RouteItem> items = [];
  @override
  void initState() {
    super.initState();
    items = getMertialItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutRoute"),
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
    // Toast.show("点击了 ${item.title} ", context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return item.newRoute;
    }));
  }
}
