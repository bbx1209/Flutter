

import 'package:flutter/material.dart';

class IndicatorRoute extends StatefulWidget {
  const IndicatorRoute({Key key}) : super(key: key);

  @override
  _IndicatorRouteState createState() => _IndicatorRouteState();
}

class _IndicatorRouteState extends State<IndicatorRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndicatorRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(25),
              child: LinearProgressIndicator(
                backgroundColor: Colors.red,
                value: 0.3,
                color: Colors.blue,
              )
            ),
            Padding(padding: EdgeInsets.all(25),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  color: Colors.blue,
                )
            ),
          CircularProgressIndicator(
            backgroundColor: Colors.red,
            value: 0.5,
            color: Colors.blue,
            semanticsLabel: "circular",
          ),

          ],
        ),
      ),
    );
  }
}
