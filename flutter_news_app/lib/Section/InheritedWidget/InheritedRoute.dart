

import 'package:flutter/material.dart';
import 'package:flutter_news_app/Section/InheritedWidget/InheritedWidget.dart';

class InheritedRoute extends StatefulWidget {
  const InheritedRoute({Key? key}) : super(key: key);

  @override
  _InheritedRouteState createState() => _InheritedRouteState();
}

class _InheritedRouteState extends State<InheritedRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedRoute"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(

            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 25),
              child: TextWithShareDateWidget(),),
              TextButton(onPressed: (){
                setState(() {
                  ++count;
                });
              }, child: Text("add")),
            ],
          ),
        ),
      ),
    );
  }
}
