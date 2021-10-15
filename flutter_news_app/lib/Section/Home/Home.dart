import 'package:flutter/material.dart';
import 'package:flutter_news_app/Base/HomeDataProvider.dart';
import 'package:flutter_news_app/Base/RoutParam.dart';
import 'package:toast/toast.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(title: 'Flutter Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RouteItem> _items = [];

  @override
  void initState() {
    super.initState();
    _items = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
          child: ListView.separated(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _items[index];
          return getItem(index, item);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(left: 25),
              child: Divider(color: Colors.black38));
        },
      )),
    );
  }

  Widget getItem(int index, RouteItem item) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text("${item.title}"),
        ),
        height: 50,
        color: Colors.white,
      ),
      onTap: () {
        setState(() {
          onItemClick(item);
        });
      },
    );
  }

  void onItemClick(RouteItem item) {
    Toast.show("点击了 ${item.title} ", this.context);
    Navigator.push(this.context, MaterialPageRoute(builder: (context) {
      return item.newRoute;
    }));
  }

  List<RouteItem> getItems() {
    return HomeDataProvider.getHomeItems();
  }
}
