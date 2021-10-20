import 'package:flutter/material.dart';

class ValueListenRoute extends StatefulWidget {
  const ValueListenRoute({Key? key}) : super(key: key);

  @override
  _ValueListenRouteState createState() => _ValueListenRouteState();
}

class _ValueListenRouteState extends State<ValueListenRoute> {
  final ValueNotifier<int> _count = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ValueListenRoute"),
        ),
        body: Center(
            child: ValueListenableBuilder<int>(
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text('$value 次',textScaleFactor: 1.5),
              ],
            );
          },
          valueListenable: _count,
          child: const Text(
            "点击了",
            textScaleFactor: 1.5,
          ),
        )),
      floatingActionButton: IconButton(icon: Icon(Icons.add),onPressed: (){
        _count.value += 1;
      },),
    );
  }
}
