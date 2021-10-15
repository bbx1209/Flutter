import 'package:flutter/material.dart';

class MyDialogRoute extends StatefulWidget {
  const MyDialogRoute({Key key}) : super(key: key);

  @override
  _MyDialogRouteState createState() => _MyDialogRouteState();
}

class _MyDialogRouteState extends State<MyDialogRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  bool result = await showDialog1(context);
                  print(result == null ? "取消" : "确认");
                },
                child: Text("Dialog"))
          ],
        ),
      ),
    );
  }

  Future<bool> showDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Title", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
            content: Text("msg content", textAlign: TextAlign.center,),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("确认", style:TextStyle(fontWeight: FontWeight.w700)))
            ],
          );
        });
  }
}
