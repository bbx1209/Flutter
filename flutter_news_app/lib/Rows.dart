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
           Center(
             child: Row(
               //默认对齐方式
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("row 1"),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                   child: Text("row 2"),
                 ),
               ],
             ),

           ),

           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
//             verticalDirection: VerticalDirection.up,

             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text("hello ", style: TextStyle(fontSize: 30)),
                   Text("worldasdfsdfgsdfghwrthrfghsfghshsdfgh",
                     overflow: TextOverflow.ellipsis,
                     maxLines: 2,
                     style: TextStyle(color: Colors.blue),
                   ),
                 ],
               )
             ],
           ),
         ],
       ),
    );
  }
}