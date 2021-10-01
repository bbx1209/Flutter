import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRoute extends StatelessWidget {
  const CupertinoRoute({Key key}) : super(key: key);

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
                    onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
