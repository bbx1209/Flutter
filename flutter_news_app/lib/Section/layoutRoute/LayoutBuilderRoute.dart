

import 'package:flutter/material.dart';

class LayoutBuilderRoute extends StatefulWidget {
  const LayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  _LayoutBuilderRouteState createState() => _LayoutBuilderRouteState();
}

class _LayoutBuilderRouteState extends State<LayoutBuilderRoute> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("LayoutBuilderRoute"),
        ),
        body: Column(
          children: [


          ],
        ));
  }
}
