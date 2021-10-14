import 'package:flutter/material.dart';

class FittedBoxRoute extends StatefulWidget {
  const FittedBoxRoute({Key key}) : super(key: key);

  @override
  _FittedBoxRouteState createState() => _FittedBoxRouteState();
}

class _FittedBoxRouteState extends State<FittedBoxRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizeBoxRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            wContainer(BoxFit.none),
            Text("Flutter"),
            wContainer(BoxFit.contain),
            Text("Flutter"),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  // wRow("dfsdfgsfdgsdfgsdfgsfgfsfdg"),
                  FittedBox(child:wRow("dfadfadsfadsfasdfadad")),
                  wRow(" 500 "),
                  FittedBox(child: wRow(" 500 "),)
                ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 15), child: e,)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget wContainer(BoxFit boxFit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      //子容器超过父容器大小
      child: Container(
        width: 60,
        height: 70,
        color: Colors.blue,
      ),
    ),
  );
}

Widget wRow(String msg) {
  Widget child = Text(msg);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
}
