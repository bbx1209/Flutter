import 'package:flutter/material.dart';

class HTTPRoute extends StatefulWidget {
  const HTTPRoute({Key? key}) : super(key: key);

  @override
  _HTTPRouteState createState() => _HTTPRouteState();
}

class _HTTPRouteState extends State<HTTPRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTPRoute"),
      ),
      body: Center(),
    );
  }
}
