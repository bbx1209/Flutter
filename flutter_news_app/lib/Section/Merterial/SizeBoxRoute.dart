import 'package:flutter/material.dart';

class SizeBoxRoute extends StatefulWidget {
  const SizeBoxRoute({Key key}) : super(key: key);

  @override
  _SizeBoxRouteState createState() => _SizeBoxRouteState();
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
  child: Center(
    child: Text("Red box"),
  ),
);

class _SizeBoxRouteState extends State<SizeBoxRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizeBoxRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: double.infinity, minHeight: 50),
                child: Container(
                  height: 10,
                  child: redBox,
                )),
            Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90, minHeight: 50),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 60, minHeight: 70),
                      child: redBox,
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 90, maxHeight: 50),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 60, maxHeight: 70),
                      child: redBox,
                    ))),
          ],
        ),
      ),
    );
  }
}
