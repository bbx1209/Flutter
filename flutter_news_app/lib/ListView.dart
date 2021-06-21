import 'package:flutter/material.dart';


class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar (
       title: Text("List View Route"),
  ),
      body: Center(
        child: ListTalbeView(),
      ),

  );
}
}




class ListTalbeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget divi1 = Divider(color: Colors.blue,);
    Widget divi2 = Divider(color: Colors.green,);

    return ListView.separated(itemBuilder:(BuildContext context,int index) {

      return ListTile(title: Text("$index"),);
    }, separatorBuilder: (BuildContext context,int index) {
    return index%2==0?divi1:divi2;
    }, itemCount: 100);
  }
}