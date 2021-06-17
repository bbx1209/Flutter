import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_app/Rows.dart';

void main() {
  runApp(MyApp());
}

class NewRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar (
        title: Text("New  Route"),
      ),
      body: Center (
        child: Text("This is new route"),
      ),
    );
  }

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
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
            FlatButton (
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                  return NewRoute();
                }));
              },
            ),
            OutlinedButton (
              child: Text("pass value"),
             onPressed:() async {
               var result =  await Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return RowRoute(text: "我是传过去的哦",);
                }));
               print("这是个回调值：$result");

              }
            )
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
