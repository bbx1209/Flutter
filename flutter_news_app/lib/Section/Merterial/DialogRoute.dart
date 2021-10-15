import 'package:flutter/material.dart';

class MyDialogRoute extends StatefulWidget {
  const MyDialogRoute({Key? key}) : super(key: key);

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
                  bool? result = await showDialog1(context);
                  print(result == null ? "取消" : "确认");
                },
                child: Text("Dialog")),
            TextButton(
                onPressed: () {
                  simpleDialog(context);
                },
                child: Text("SimpleDialog")),
            TextButton(
                onPressed: () {
                  showListDialog(context);
                },
                child: Text("ListDialog")),
            TextButton(
                onPressed: () {
                  showUnconstrainsDialog(context);
                },
                child: Text("showUnconstrainsDialog")),
          ],
        ),
      ),
    );
  }

  Future<bool?> showDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Title", textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),),
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
                  child: Text(
                      "确认", style: TextStyle(fontWeight: FontWeight.w700)))
            ],
          );
        });
  }

  Future<void> simpleDialog(BuildContext context) async {
    int? i = await showDialog<int>(context: context, builder: (context) {
      return SimpleDialog(
        title: Text("选择吧"),
        children: [
          SimpleDialogOption(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("英语"),
            ),
            onPressed: () {
              Navigator.pop(context, 1);
            },
          ),
          SimpleDialogOption(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("中文"),
            ),
            onPressed: () {
              Navigator.pop(context, 2);
            },
          )
        ],
      )
    });
    if (i != null) {
      print("${i == 1 ? "英文" : "中文"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int? index = await showDialog(context: context, builder: (context) {
      return Dialog(
        child: Column(
          children: [
            ListTile(title: Text("请选择"),),
            Expanded(child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${index}",
                  ), onTap: () {
                  Navigator.of(context).pop(index);
                },
                );
              },

            ),

            )
          ],
        ),
      );
    });
    if (index != null) {
      print("点击了${index}");
    }
  }

  Future<void> showUnconstrainsDialog(BuildContext context) async {
    int? index = await showDialog(context: context, builder: (context) {
      var child = Column(
        children: [
          ListTile(title: Text("请选择"),),
          Expanded(child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("${index}",
                ), onTap: () {
                Navigator.of(context).pop(index);
              },
              );
            },

          ),

          )
        ],
      );
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, maxWidth: 200),
          child: Material(
            child: child,
            type: MaterialType.card,
          ),
        ),
      );
    });
    if (index != null) {
      print("点击了${index}");
    }
  }

}
