import 'package:flutter/material.dart';



class RowRoute extends StatelessWidget {

  RowRoute({
    Key key,
  @required  this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Row flow test"),
      ),
       body: Column(
         children: [
           Center(
             child: Column(
               children: [
                 Text("$text"),
                 ElevatedButton(onPressed: () => Navigator.pop(context,"我是返回值"),
                 child: Text("返回"),
                 ),

                 FloatingActionButton(onPressed: () {
                   print("flating button");
                 }),
                 
                 OutlinedButton(onPressed: () {
                   print("out lined button");
                 }, child: Text("button"))

               ],
             ),
           ),
         ],
       ),
    );
  }
}