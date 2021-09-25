
import 'package:flutter/cupertino.dart';

class RouteItem {
  ///展示的标题
  String title;
  ///跳转的新路由
  Widget newRoute;

  RouteItem(this.title, this.newRoute);
}