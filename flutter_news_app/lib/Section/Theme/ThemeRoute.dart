

import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  const ThemeRoute({Key? key}) : super(key: key);

  @override
  _ThemeRouteState createState() => _ThemeRouteState();
}

class _ThemeRouteState extends State<ThemeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThemeRoute"),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
