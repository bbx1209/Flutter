
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/Async/AsyncRoute.dart';
import 'package:flutter_news_app/Section/Cupertino/CupertinoRoute.dart';
import 'package:flutter_news_app/Section/CustomClip/CustomCliperRute.dart';
import 'package:flutter_news_app/Section/CustomScrollView/CustomScrollRoute.dart';
import 'package:flutter_news_app/Section/DartLanguage/DartLanguageRoute.dart';
import 'package:flutter_news_app/Section/FunctionWidget/FunctionWidgetRoute.dart';
import 'package:flutter_news_app/Section/FutureBuilder/FutureBuliderRoute.dart';
import 'package:flutter_news_app/Section/Gesture/GestureRoute.dart';
import 'package:flutter_news_app/Section/Interface/ConstValue.dart';
import 'package:flutter_news_app/Section/Merterial/Merterial.dart';
import 'package:flutter_news_app/Section/MethodChannel/MethodChannelRoute.dart';
import 'package:flutter_news_app/Section/RouteLifeCycle/RouteLifeCycle.dart';
import 'package:flutter_news_app/Section/Scaffold/ScaffoldRoute.dart';
import 'package:flutter_news_app/Section/layoutRoute/LayoutRoute.dart';

import '../ListView.dart';

class HomeDataProvider {
   static List<RouteItem> getHomeItems() {
    List<RouteItem> items = [

      RouteItem("ScaffoldRoute", ScaffoldRoute()),
      RouteItem("FunctionWidgetRoute", FunctionWidgetRoute()),
      RouteItem("LayoutRoute", LayoutRoute()),
      RouteItem("列表", ListViewRoute()),
      RouteItem("页面元素", MerterialRoute()),
      RouteItem("Async", AsyncRoute()),
      RouteItem("Dart Language ", DartLanguageRoute()),
      RouteItem("Route 生命周期 ", StatefulRouteCycle()),
      RouteItem("CupertinoRoute", CupertinoRoute()),
      RouteItem("插件 Method channel", MethodChannelRoute()),
      RouteItem("手势", GestureRoute()),
      RouteItem("CustomScrollRoute", CustomScrollRoute()),
      RouteItem("FutureBulider StreamBulider", FutureBuliderRoute()),
      RouteItem("CustomClipRoute", CustomClipRoute()),


      
    ];
    return items;
  }
}