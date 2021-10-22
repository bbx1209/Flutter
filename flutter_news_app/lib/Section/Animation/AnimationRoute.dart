

import 'package:flutter/material.dart';

class AnimationRoute extends StatefulWidget {
  const AnimationRoute({Key? key}) : super(key: key);

  @override
  _AnimationRouteState createState() => _AnimationRouteState();
}

class _AnimationRouteState extends State<AnimationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationRoute"),
      ),
    );
  }
}
