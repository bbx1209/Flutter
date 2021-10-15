import 'package:flutter/material.dart';
import 'EventBus.dart';

class EventBusRoute extends StatefulWidget {
  const EventBusRoute({Key? key}) : super(key: key);

  @override
  _EventBusRouteState createState() => _EventBusRouteState();
}

class _EventBusRouteState extends State<EventBusRoute> {
  @override
  Widget build(BuildContext context) {

    bus.on("print", (arg) {
      print("receive note");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("EventBusRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: TextButton(
                child: Text("下个页面"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EventBusRoute2();
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EventBusRoute2 extends StatelessWidget {
  const EventBusRoute2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBusRoute2"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: TextButton(
                child: Text("发送广播"),
                onPressed: () {
                  bus.emit("print");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
