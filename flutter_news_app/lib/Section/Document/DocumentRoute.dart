



import 'package:flutter/material.dart';
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/Document/PathProviderRoute.dart';

List<RouteItem> getMertialItems() {
  List<RouteItem> items = [
    RouteItem("PathProviderRoute", PathProviderRoute()),
    // RouteItem("MoveGestureRoute", MoveGestureRoute()),
    // RouteItem("ScaleGestureRoute", ScaleGestureRoute()),
    // RouteItem("EventBusRoute", EventBusRoute()),
    // RouteItem("NotifyRoute", NotifyRoute()),
    // RouteItem("NotifyRouteII", NotifyRouteII()),
    // RouteItem("CustonNotifyRoute", CustonNotifyRoute()),


  ];
  return items;
}

class DocumentRoute extends StatefulWidget {
  const DocumentRoute({Key? key}) : super(key: key);

  @override
  _DocumentRouteState createState() => _DocumentRouteState();
}

class _DocumentRouteState extends State<DocumentRoute> {
  List<RouteItem> items = [];
  @override
  Widget build(BuildContext context) {
    items = getMertialItems();
    return Scaffold(
      appBar: AppBar(
        title: Text("DocumentRoute"),
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
