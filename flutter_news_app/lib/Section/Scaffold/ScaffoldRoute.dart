import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selected =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaffoldRoute"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share))
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selected,
        onTap: (index){
          setState(() {
            _selected = index;
          });
        },
        selectedItemColor: Colors.red,
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 70, left: 25),
                child: Row(
                   children: [
                     Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                       child: ClipOval(
                           child: Image.asset("images/mao.png", width: 80,)
                       ),),
                     Text("name", style: TextStyle(fontWeight: FontWeight.bold),)
                   ],
                ),
              ),

              Expanded(child: ListView(
                children: [
                  ListTile(title: const Text("add accout"),leading: const Icon(Icons.add),),
                  ListTile(title: const Text("settings"),leading: const Icon(Icons.settings),)
                ],
              ))


            ],
          )),
    );
  }
}
