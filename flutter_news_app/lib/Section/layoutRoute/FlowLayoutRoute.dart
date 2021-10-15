

import 'package:flutter/material.dart';

class WrapLayouteRoute extends StatefulWidget {
  const WrapLayouteRoute({Key key}) : super(key: key);

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
      body:
         Wrap(
          alignment: WrapAlignment.center,
          // crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8.0,
          runSpacing: 4.0,
          children: [
            Chip(
              avatar: CircleAvatar(backgroundColor:Colors.blue, child: Text("A")),
              label: Text("adapter"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor:Colors.blue, child: Text("B")),
              label: Text("banifit"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
              label: Text('Lafayee'),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
              label: Text('Mullgan'),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: Text('Laurens'),
            ),
          ],

        ),

    );
  }
}


class FlowLayouteRoute extends StatefulWidget {
  const FlowLayouteRoute({Key key}) : super(key: key);

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
      body: Wrap(

      ),
    );
  }
}

