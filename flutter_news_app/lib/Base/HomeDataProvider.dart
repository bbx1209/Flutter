
import 'package:flutter_news_app/Base/RoutParam.dart';

import '../ListView.dart';

class HomeDataProvider {
   static List<RouteItem> getHomeItems() {
    List<RouteItem> items = [

      RouteItem("列表", ListViewRoute()),

    ];
    return items;
  }
}