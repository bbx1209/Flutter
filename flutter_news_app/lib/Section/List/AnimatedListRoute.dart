import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  const AnimatedListRoute({Key? key}) : super(key: key);

  @override
  _AnimatedListRouteState createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute> {
  var data = <String>[];
  int count = 6;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < count; i++) {
      data.add("${i + 1}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedListRoute"),
      ),
      body: Stack(
        children: [
          AnimatedList(
              initialItemCount: data.length,
              key: globalKey,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: buildItem(context, index),
                );
              }),
          buildAddButton(),
        ],
      ),
    );
  }

  Widget buildAddButton() {
    return Positioned(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          data.add("${++count}");
          globalKey.currentState!.insertItem(data.length - 1);
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  void onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        // 删除过程执行的是反向动画，animation.value 会从1变为0
        var item = buildItem(context, index);
        data.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(
              parent: animation, curve: const Interval(0.5, 1.0)),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );

      },
      duration: Duration(milliseconds: 200),
      );

    });
  }
}
