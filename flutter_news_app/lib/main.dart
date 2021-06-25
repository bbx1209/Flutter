import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_app/Rows.dart';
import 'package:flutter_news_app/ListView.dart';

void main() {
  runApp(MyApp());
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New  Route"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("This is new route"),
          ),
          ItemView(),
          Container(
            transform: Matrix4.rotationZ(.2),
            padding: EdgeInsets.all(25.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset("images/1.png"),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50,
              minWidth: 50,
            ),
            child: redBox,
          ),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: redBox,
              )),
        ],
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
//        boxShadow: [
//          BoxShadow(color: Colors.grey ,offset: Offset(2.0,2.0), blurRadius: 4.0)
//        ]
          color: Colors.cyan),
      height: 85.0,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                "images/1.png",
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // text需要给出一个宽度，否则会有溢出警告
                      width: (screenWidth - 175),
                      child: Text(
                        "Item title gsfgsgvbxvbgh工号地方搞活动覆盖和dgsdfgsfdgsgsfgsfgsfgsfgsfgfgh",
                        style: TextStyle(fontSize: 18.0, color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      )),
                  Text("Item sub title 撒打发斯蒂芬"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "newRoute": (context) => NewRoute(),
        "RowRoute": (context) => RowRoute(text: "来自注册路由"),
        "ImageRoute": (context) => ImageRoute(),
        "ListViewRoute": (context) => ListViewRoute()
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
            OutlinedButton(
                child: Text("pass value"),
                onPressed: () async {
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return RowRoute(
                      text: "我是传过去的哦",
                    );
                  }));
                  print("这是个回调值：$result");
                }),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "RowRoute");
                },
                child: Text("注册路由")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ImageRoute");
                },
                child: Text("Image route")),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ListViewRoute");
                },
                child: Text("ListView route")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
