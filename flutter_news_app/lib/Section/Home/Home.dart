import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../main.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.cyan,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: 50,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return getItem(index);
        },
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   Widget getItem(int index) {
    return GestureDetector(
      child: Container(
        child: Text("$index"),
        height: 50,
      ),
      onTap: (){
        setState(() {
          onItemClick(index);
        });
      },
    );
   }

  void onItemClick(int index) {
    Toast.show("点击了底$index 行", this.context);
  }
}
