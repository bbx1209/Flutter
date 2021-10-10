import 'package:flutter/material.dart';

class CheckBoxRoute extends StatefulWidget {
  const CheckBoxRoute({Key key}) : super(key: key);

  @override
  _CheckBoxRouteState createState() => _CheckBoxRouteState();
}

class _CheckBoxRouteState extends State<CheckBoxRoute> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckBoxRoute"),
        ),
        body: Center(
          child: Column(
            children: [
              Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  }),
              Checkbox(
                  value: _checkboxSelected,
                  // fillColor:MaterialStateColor.resolveWith((states) => Colors.red),
                  activeColor: Colors.yellow,
                  checkColor: Colors.black,//对号的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  }),
            ],
          ),
        ));
  }
}
