
import 'package:flutter/material.dart';

class ScaleGestureRoute extends StatefulWidget {
  const ScaleGestureRoute({Key? key}) : super(key: key);

  @override
  _ScaleGestureRouteState createState() => _ScaleGestureRouteState();
}

class _ScaleGestureRouteState extends State<ScaleGestureRoute> {
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MoveGestureRoute"),
        ),
        body: Center(
          child: GestureDetector(
            child: Image.asset("images/mao.png", width: _width),
            onScaleUpdate: (ScaleUpdateDetails e){
              setState(() {
                _width=200*e.scale.clamp(.1, 20.0);
              });
            },
          ),
        )
    );
  }
}
