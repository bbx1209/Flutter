
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:flutter_news_app/Section/Animation/AnimationRoute.dart';
import 'package:flutter_news_app/Section/Async/AsyncRoute.dart';
import 'package:flutter_news_app/Section/Cupertino/CupertinoRoute.dart';
import 'package:flutter_news_app/Section/CustomClip/CustomCliperRute.dart';
import 'package:flutter_news_app/Section/CustomScrollView/CustomScrollRoute.dart';
import 'package:flutter_news_app/Section/DartLanguage/DartLanguageRoute.dart';
import 'package:flutter_news_app/Section/Document/DocumentRoute.dart';
import 'package:flutter_news_app/Section/FunctionWidget/FunctionWidgetRoute.dart';
import 'package:flutter_news_app/Section/FutureBuilder/FutureBuliderRoute.dart';
import 'package:flutter_news_app/Section/Gesture/GestureRoute.dart';
import 'package:flutter_news_app/Section/HTTP/HttpRoute.dart';
import 'package:flutter_news_app/Section/ImagePicker/ImagePickerRoute.dart';
import 'package:flutter_news_app/Section/InheritedWidget/InheritedProviderRoute.dart';
import 'package:flutter_news_app/Section/InheritedWidget/InheritedRoute.dart';
import 'package:flutter_news_app/Section/InheritedWidget/ProviderTest/ProviderRoute.dart';
import 'package:flutter_news_app/Section/Interface/ConstValue.dart';
import 'package:flutter_news_app/Section/JsonConvert/JsonConvert.dart';
import 'package:flutter_news_app/Section/List/ListRoute.dart';
import 'package:flutter_news_app/Section/Merterial/Merterial.dart';
import 'package:flutter_news_app/Section/MethodChannel/MethodChannelRoute.dart';
import 'package:flutter_news_app/Section/RouteLifeCycle/RouteLifeCycle.dart';
import 'package:flutter_news_app/Section/Scaffold/ScaffoldRoute.dart';
import 'package:flutter_news_app/Section/Theme/ThemeRoute.dart';
import 'package:flutter_news_app/Section/ValueListenRoute/ValueListenRoute.dart';
import 'package:flutter_news_app/Section/layoutRoute/LayoutRoute.dart';

import '../ListView.dart';

class HomeDataProvider {
   static List<RouteItem> getHomeItems() {
    List<RouteItem> items = [


      RouteItem("ImagePickerRoute", ImagePickerRoute()),
      RouteItem("AnimationRoute", AnimationRoute()),
      RouteItem("HTTPRoute", HTTPRoute()),
      RouteItem("JsonConvert", JsonConvert()),
      RouteItem("DocumentRoute", DocumentRoute()),
      RouteItem("ValueListenRoute", ValueListenRoute()),
      RouteItem("ThemeRoute", ThemeRoute()),
      RouteItem("ProviderRoute", ProviderRoute()),
      RouteItem("InheritedProviderRoute", InheritedProviderRoute()),
      RouteItem("InheritedRoute", InheritedRoute()),
      RouteItem("ScaffoldRoute", ScaffoldRoute()),
      RouteItem("FunctionWidgetRoute", FunctionWidgetRoute()),
      RouteItem("LayoutRoute", LayoutRoute()),
      RouteItem("??????", ListViewRoute()),
      RouteItem("ListRoute", ListRoute()),

      RouteItem("????????????", MerterialRoute()),
      RouteItem("Async", AsyncRoute()),
      RouteItem("Dart Language ", DartLanguageRoute()),
      RouteItem("Route ???????????? ", StatefulRouteCycle()),
      RouteItem("CupertinoRoute", CupertinoRoute()),
      RouteItem("?????? Method channel", MethodChannelRoute()),
      RouteItem("??????", GestureRoute()),
      RouteItem("CustomScrollRoute", CustomScrollRoute()),
      RouteItem("FutureBulider StreamBulider", FutureBuliderRoute()),
      RouteItem("CustomClipRoute", CustomClipRoute()),


      
    ];
    return items;
  }
}