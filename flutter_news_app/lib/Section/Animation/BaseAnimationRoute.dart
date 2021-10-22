
import 'package:flutter/material.dart';

class BaseAnimationRoute extends StatefulWidget {
  const BaseAnimationRoute({Key? key}) : super(key: key);

  @override
  _BaseAnimationRouteState createState() => _BaseAnimationRouteState();
}

class _BaseAnimationRouteState extends State<BaseAnimationRoute> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    //匀速
    // animation = Tween(begin: 0.0, end: 300.0).animate(controller)
    // ..addListener(() {
    //   setState(() {
    //
    //   });
    //用 animationwidget 简化后
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);


    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BaseAnimationRoute"),
      ),
      body: Center(
        // child: Image.asset("images/mao.png",width: animation.value,height: animation.value,),
        //用 animationwidget 简化后
        child: AnimationImage(animation: animation),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// 用 AnimationWidget 简化

class AnimationImage extends AnimatedWidget {
  AnimationImage({Key? key ,required Animation<double>animation}) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset("images/mao.png",
      width: animation.value,
      height: animation.value,),
    );

  }

}
