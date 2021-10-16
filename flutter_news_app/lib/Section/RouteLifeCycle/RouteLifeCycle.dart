

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:toast/toast.dart';


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
* push 到新页面前 当前页面会 build 一次
* 从后台唤醒或者上层页面 pop回来,当前页面不会 build.  感觉哪里不对
*
*/



class StatefulRouteCycle extends StatefulWidget {
  const StatefulRouteCycle({Key? key}) : super(key: key);

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
                // Toast.show("click update ", context);
              });
          },
              icon: Icon(Icons.update), label:
              Text("更新按钮")),
          TextButton.icon(
              onPressed: (){setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext mContext) {
                  return RouteLifeCycleNewRoute();
                }));
              });
              },
              icon: Icon(Icons.accessibility_sharp), label:
          Text("push new route")),
        ],
      ),
    ),
    );
  }
}

class RouteLifeCycleNewRoute extends StatelessWidget {
  const RouteLifeCycleNewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouteLifeCycleNewRoute"),
      ),
    );
  }
}


