


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AsyncRoute extends StatefulWidget {
  const AsyncRoute({Key key}) : super(key: key);

  @override
  _AsyncRouteState createState() => _AsyncRouteState();
}

class _AsyncRouteState extends State<AsyncRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Async"),

      ),
    );
  }
}
