import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';


const oneSecond = Duration(seconds: 1);

class AsyncRoute extends StatefulWidget {
  const AsyncRoute({Key? key}) : super(key: key);

  @override
  _AsyncRouteState createState() => _AsyncRouteState();
}

class _AsyncRouteState extends State<AsyncRoute> {

  @override
  void initState() {
    super.initState();

    prinWithDelay("delay one second print");
  }

  Future<void> prinWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
    Toast.show(message, this.context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Async"),

      ),
    );
  }
}
