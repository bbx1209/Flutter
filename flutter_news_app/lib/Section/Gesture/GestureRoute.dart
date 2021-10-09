import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
  const GestureRoute({Key key}) : super(key: key);

  @override
  _GestureRouteState createState() => _GestureRouteState();
}

class _GestureRouteState extends State<GestureRoute> {
  String _operation = "no gesture action";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GestureRoute"),
        ),
        body: Center(
            child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("tap"),
          onLongPress: () => updateText("long press"),
          onDoubleTap: () => updateText("double tap"),
        )));
  }

  updateText(String s) {
    setState(() {
      _operation = s;
    });
  }
}
