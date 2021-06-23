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
      appBar: AppBar (
        title: Text("New  Route"),
      ),
      body: Column (
        children: [
          Center (
            child: Text("This is new route"),
          ),
          Center (
            child: ItemView(),
          ),

          
          Container(
            transform: Matrix4.rotationZ(.2),
            padding: EdgeInsets.all(25.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset("images/1.png"),
            ),
          )
        ],
      ),



    );
  }

}

class ItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15.0),
    child: Container(
//      decoration: BoxDecoration(
//        boxShadow: [
//          BoxShadow(color: Colors.grey ,offset: Offset(2.0,2.0), blurRadius: 4.0)
//        ]
//      ),
      height: 65.0,
      child: Row(
        children: [
          Image.asset("images/1.png",width: 50.0, height: 50.0,),
          Padding(padding: const EdgeInsets.all(10.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Expanded(
                        child:Text("Item title gsfgsdfgsdfgsdfgsdfgsdfgvbxvbghdfgh", style: TextStyle(fontSize: 18.0, color: Colors.red),overflow: TextOverflow.ellipsis,maxLines: 1,),
                ),
                    Expanded(child: Text("Item sub title")),


                ],
              ),

          ),
        ],
      ),
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

      routes: {
        "newRoute":(context) => NewRoute(),
        "RowRoute":(context) => RowRoute(text: "来自注册路由"),
        "ImageRoute":(context) => ImageRoute(),
        "ListViewRoute" :(context) => ListViewRoute()
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
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, "RowRoute");
            }, child: Text("注册路由")),

            TextButton(onPressed: (){
              Navigator.pushNamed(context, "ImageRoute");
            }, child: Text("Image route")),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, "ListViewRoute");
            }, child: Text("ListView route")),
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
