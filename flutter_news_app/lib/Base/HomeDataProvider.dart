
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/Async/AsyncRoute.dart';
import 'package:flutter_news_app/Section/DartLanguage/DartLanguageRoute.dart';
import 'package:flutter_news_app/Section/Interface/ConstValue.dart';
import 'package:flutter_news_app/Section/Merterial/Merterial.dart';

import '../ListView.dart';

class HomeDataProvider {
   static List<RouteItem> getHomeItems() {
    List<RouteItem> items = [

      RouteItem("列表", ListViewRoute()),
      RouteItem("页面元素", MerterialRoute()),
      RouteItem("Async", AsyncRoute()),
      RouteItem("Dart Language ", DartLanguageRoute()),
    ];
    return items;
  }
}