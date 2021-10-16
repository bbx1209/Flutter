import 'package:flutter/cupertino.dart';
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
            TextButton(
                onPressed: () async {
                  bool? result = await showCheckboxDialog(context);
                  if (result == null) {
                    print("取消");
                  } else {
                    print("删除 ${result}");
                  }
                },
                child: Text("show Checkbox dialog ")),
            TextButton(
                onPressed: () async {
                  bool? result = await showCheckboxDialog2(context);
                  if (result == null) {
                    print("取消");
                  } else {
                    print("删除 ${result}");
                  }
                },
                child: Text("show Checkbox dialog2 ")),
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

//TODO:  need config
  // Future<T?> showCustomDialog<T>({
  //   required BuildContext context,
  //   bool barrierDismissible = true,
  //   required WidgetBuilder builder,
  //   ThemeData? theme,
  // }) {
  //   final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  //   return showGeneralDialog(
  //     context: context,
  //     pageBuilder: (BuildContext buildContext, Animation<double> animation,
  //         Animation<double> secondaryAnimation) {
  //       final Widget pageChild = Builder(builder: builder);
  //       return SafeArea(
  //         child: Builder(builder: (BuildContext context) {
  //           return theme != null
  //               ? Theme(data: theme, child: pageChild)
  //               : pageChild;
  //         }),
  //       );
  //     },
  //     barrierDismissible: barrierDismissible,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: Colors.black87, // 自定义遮罩颜色
  //     transitionDuration: const Duration(milliseconds: 150),
  //     transitionBuilder: _buildMaterialDialogTransitions,
  //   );
  // }
  //
  // Widget _buildMaterialDialogTransitions(
  //     BuildContext context,
  //     Animation<double> animation,
  //     Animation<double> secondaryAnimation,
  //     Widget child) {
  //   // 使用缩放动画
  //   return ScaleTransition(
  //     scale: CurvedAnimation(
  //       parent: animation,
  //       curve: Curves.easeOut,
  //     ),
  //     child: child,
  //   );
  // }child

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


  Future<bool?> showCheckboxDialog(BuildContext context) {
    bool _checkboxSelected = false;
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("确定要删除文件吗？"),
            Row(
              children: [
                Text("同时删除子目录？"),
                CheckboxDialog(onChanged: (bool value) {
                  _checkboxSelected = !_checkboxSelected;
                }, value: _checkboxSelected,)

              ],
            )
          ],
        ),
        actions: [
          TextButton(
            child: Text("取消"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pop(_checkboxSelected);
          }, child: Text("删除")),
        ],
      );
    });
  }

  Future<bool?> showCheckboxDialog2(BuildContext context) {
    bool _checkboxSelected = false;
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("确定要删除文件吗？"),
            Row(
              children: [
                Text("同时删除子目录？"),
                StatefulBuilder(builder: (context, _setState){
                  return Checkbox(
                    value: _checkboxSelected,
                    onChanged: (bool? value){
                      _setState((){
                        _checkboxSelected=!_checkboxSelected;
                      });
                    },
                  );
                })

              ],
            )
          ],
        ),
        actions: [
          TextButton(
            child: Text("取消"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pop(_checkboxSelected);
          }, child: Text("删除")),
        ],
      );
    });
  }



}


class CheckboxDialog extends StatefulWidget {
  CheckboxDialog({Key? key,
    this.value,
    required this.onChanged}) : super(key: key);

  final ValueChanged<bool> onChanged;
  final bool? value;

  @override
  _CheckboxDialogState createState() => _CheckboxDialogState();
}

class _CheckboxDialogState extends State<CheckboxDialog> {

  bool? value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (v) {
      setState(() {
        value = v;
      });
    });
  }
}


class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key? key,
    required this.builder
  })
      : assert(builder != null),
        super(key: key);


  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();


}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, setState);
  }

}
