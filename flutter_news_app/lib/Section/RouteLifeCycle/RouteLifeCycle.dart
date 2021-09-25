

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateLessRouteCycle extends StatelessWidget {
  const StateLessRouteCycle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("StateLessRouteCycle"),
      ),

    );
  }
}

class StatefulRouteCycle extends StatefulWidget {
  const StatefulRouteCycle({Key key}) : super(key: key);

  @override
  _StatefulRouteCycleState createState() => _StatefulRouteCycleState();
}

class _StatefulRouteCycleState extends State<StatefulRouteCycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulRouteCycle"),
      ),

    );
  }
}

