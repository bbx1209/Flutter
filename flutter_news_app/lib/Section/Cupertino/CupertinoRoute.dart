import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRoute extends StatefulWidget {
  const CupertinoRoute({Key key}) : super(key: key);

  @override
  _CupertinoRouteState createState() => _CupertinoRouteState();
}

class _CupertinoRouteState extends State<CupertinoRoute> {
  bool _switchSelected = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("CupertinoRoute"),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 110),
          child: Center(
            child: Column(
              children: [
                CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: Text("Click"),
                    onPressed: () {}),
                CupertinoSwitch(
                    value: _switchSelected,
                    activeColor: CupertinoColors.activeGreen,
                    onChanged: (value) {
                      setState(() {
                        _switchSelected = value;
                      });
                    }),

              ],
            ),
          ),
        ));
  }
}
