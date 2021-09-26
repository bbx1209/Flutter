

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


/*
* 创建
* initState
* didChangeDependencies
* build
* 销毁
* deactivate
* dispose
*
* setState 方法调用之后会重走 build 方法
*
*/



class StatefulRouteCycle extends StatefulWidget {
  const StatefulRouteCycle({Key key}) : super(key: key);

  @override
  _StatefulRouteCycleState createState() => _StatefulRouteCycleState();
}

class _StatefulRouteCycleState extends State<StatefulRouteCycle> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
  }


  @override
  void didUpdateWidget(covariant StatefulRouteCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");

  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulRouteCycle"),
      ),
    body: Center(
      child: Column(
        children: [
          TextButton.icon(
              onPressed: (){setState(() {
                Toast.show("click update ", context);
              });
          },
              icon: Icon(Icons.update), label:
              Text("更新按钮"))
        ],
      ),
    ),
    );
  }
}

