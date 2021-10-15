import 'package:flutter/material.dart';

class StackRoute extends StatefulWidget {
  const StackRoute({Key key}) : super(key: key);

  @override
  _StackRouteState createState() => _StackRouteState();
}

class _StackRouteState extends State<StackRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlexRoute"),
        ),
        // ConstrainedBox 保证 stack 占满整个屏幕
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text("only text"), //默认居中
              Positioned(top: 25, child: Text("top constraint")),
              Positioned(left: 25, child: Text("left constraint")),
              Positioned(bottom: 25, child: Text("bottom constraint")),
              Positioned(right: 25, child: Text("right constraint")),
            ],
          ),
        ));
  }
}
