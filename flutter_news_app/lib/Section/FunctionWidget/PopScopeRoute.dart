import 'package:flutter/material.dart';

class PopScopeRoute extends StatefulWidget {
  const PopScopeRoute({Key? key}) : super(key: key);

  @override
  _PopScopeRouteState createState() => _PopScopeRouteState();
}

class _PopScopeRouteState extends State<PopScopeRoute> {

  DateTime? _lastPressdAt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopScopeRoute"),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          if (_lastPressdAt == null
              || DateTime.now().difference(_lastPressdAt!) > Duration(seconds: 1)) {
            _lastPressdAt = DateTime.now();
            print("没到条件");
            return false;
          }
          print("到条件了");
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("on will pop scope; 1秒点两次就退出"),
        )
      ),
    );
  }
}
