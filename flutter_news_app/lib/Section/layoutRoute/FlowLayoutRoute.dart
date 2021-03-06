import 'package:flutter/material.dart';

class WrapLayouteRoute extends StatefulWidget {
  const WrapLayouteRoute({Key? key}) : super(key: key);

  @override
  _WrapLayouteRouteState createState() => _WrapLayouteRouteState();
}

class _WrapLayouteRouteState extends State<WrapLayouteRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapLayouteRoute'),
      ),
      body: Wrap(
        alignment: WrapAlignment.center,
        // crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8.0,
        runSpacing: 4.0,
        children: [
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text("A")),
            label: Text("adapter"),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text("B")),
            label: Text("banifit"),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
            label: Text('Lafayee'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
            label: Text('Mullgan'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }
}

class FlowLayouteRoute extends StatefulWidget {
  const FlowLayouteRoute({Key? key}) : super(key: key);

  @override
  _FlowLayouteRouteState createState() => _FlowLayouteRouteState();
}

class _FlowLayouteRouteState extends State<FlowLayouteRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FlowLayouteRoute'),
        ),
        body: Flow(
          delegate: MyFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
          ],
        ));
  }
}

class MyFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  MyFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //??????????????????widget?????????
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //?????????widget(?????????)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
// ??????Flow????????????????????????????????????????????????????????????????????????200???
    // ???????????????????????????????????????????????????????????????????????????Flow??????
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
