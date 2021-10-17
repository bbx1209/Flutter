import 'package:flutter/material.dart';
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/FunctionWidget/PopScopeRoute.dart';

List<RouteItem> getMertialItems() {
  List<RouteItem> items = [
    RouteItem("PopScopeRoute", PopScopeRoute()),
  ];
  return items;
}

class FunctionWidgetRoute extends StatefulWidget {
  FunctionWidgetRoute({Key? key}) : super(key: key);

  @override
  _FunctionWidgetRouteState createState() => _FunctionWidgetRouteState();
}

class _FunctionWidgetRouteState extends State<FunctionWidgetRoute> {
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
        title: Text("FunctionWidgetRoute"),
      ),
      body: Center(
          child: ListView.separated(
        itemBuilder: (BuildContext buildContext, int index) {
          var item = items[index];
          return getItem(context, index, item);
        },
        separatorBuilder: (BuildContext buildContext, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 25),
            child: Divider(
              color: Colors.black38,
            ),
          );
        },
        itemCount: items.length,
      )),
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
      onTap: () {
        onClickItem(context, item);
      },
    );
  }

  void onClickItem(BuildContext context, RouteItem item) {
    // Toast.show("点击了 ${item.title} ", context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return item.newRoute;
    }));
  }
}
