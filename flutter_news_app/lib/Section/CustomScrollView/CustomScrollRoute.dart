import 'package:flutter/material.dart';

class CustomScrollRoute extends StatefulWidget {
  const CustomScrollRoute({Key key}) : super(key: key);

  @override
  _CustomScrollRouteState createState() => _CustomScrollRouteState();
}

class _CustomScrollRouteState extends State<CustomScrollRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("This is title", style: TextStyle(color: Colors.black),),
              background: Image.asset("images/mao.png", fit: BoxFit.cover),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 4),
              delegate: new SliverChildBuilderDelegate(
                (context, index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text("grid item $index"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

          new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate((context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 *(index%9)],
                  child: new Text("List item $index"),
                );
              },
              childCount: 50),
              itemExtent: 50.0,
          ),

        ],
      ),
    );
  }
}
