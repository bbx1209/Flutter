import 'package:flutter/material.dart';

class EventBusRoute extends StatefulWidget {
  const EventBusRoute({Key key}) : super(key: key);

  @override
  _EventBusRouteState createState() => _EventBusRouteState();
}

class _EventBusRouteState extends State<EventBusRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBusRoute"),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

typedef void EventCallBack(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //单例模式
  static EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存时间订阅者。key 为时间名称， value为时间订阅者队列
  final _emap = Map<Object, List<EventCallBack>>();

  // 添加订阅者
  void on(eventname, EventCallBack f) {
    _emap[eventname] ??= <EventCallBack>[];
    _emap[eventname].add(f);
  }

//移除订阅者

  void off(eventname, [EventCallBack f]) {
    var list = _emap[eventname];
    if (eventname == null || list == null) return;
    if (f == null) {
      _emap[eventname] = null;
    } else {
      list.remove(f);
    }
  }

//触发事件
  void emit(eventname, [arg]) {
    var list = _emap[eventname];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}
