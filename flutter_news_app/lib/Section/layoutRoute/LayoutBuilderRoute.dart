import 'package:flutter/material.dart';

class LayoutBuilderRoute extends StatefulWidget {
  const LayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  _LayoutBuilderRouteState createState() => _LayoutBuilderRouteState();
}

class _LayoutBuilderRouteState extends State<LayoutBuilderRoute> {
  var _children = List.filled(6, Text("A"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LayoutBuilderRoute"),
        ),
        body: Column(

          children: [
            SizedBox(width: 190, child: ResponsiceColumn(children: _children,),),
            ResponsiceColumn(children: _children),
            LayoutPrint(child: Text("xx")),

          ],
        ));
  }
}

class LayoutPrint<T> extends StatelessWidget {
  const LayoutPrint({Key? key, this.tag, required this.child}) : super(key: key);

  final Widget child;
  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints){
      assert((){
        print("${tag ?? key ?? child} : $constraints");
        return true;
      }());
      return child;
    });
  }
}



class ResponsiceColumn extends StatelessWidget {
  const ResponsiceColumn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if (constraints.maxWidth < 200) {
        return Column(children: children, mainAxisSize: MainAxisSize.min,);
      } else {
        var _children = <Widget>[];
        for (var i=0; i < children.length; i+= 2 ) {
          if(i + 1 < children.length) {
            _children.add(Row(children: [children[i], children[i+1]],mainAxisSize: MainAxisSize.min,));
          } else {
            _children.add(children[i]);
          }
        }
        return Column(children: _children, mainAxisSize: MainAxisSize.min,);
      }
    });
  }
}
