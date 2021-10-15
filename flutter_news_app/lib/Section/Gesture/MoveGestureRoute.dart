import 'package:flutter/material.dart';

class MoveGestureRoute extends StatefulWidget {
  const MoveGestureRoute({Key? key}) : super(key: key);

  @override
  _MoveGestureRouteState createState() => _MoveGestureRouteState();
}

class _MoveGestureRouteState extends State<MoveGestureRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MoveGestureRoute"),
        ),
        body: Stack(
          children: [
            Positioned(
                top: _top,
                left: _left,
                child: GestureDetector(
                  child: CircleAvatar(
                    child: Text("A"),
                  ),
                  onPanDown: (DragDownDetails e) {
                    print("手指按下: ${e.globalPosition}");
                  },
                  onPanUpdate: (DragUpdateDetails e) {
                    setState(() {
                      _left += e.delta.dx;
                      _top += e.delta.dy;
                    });
                  },
                  onPanEnd: (DragEndDetails e) {
                    print(e.velocity);
                  },
                ))
          ],
        ));
  }
}
