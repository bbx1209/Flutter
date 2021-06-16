import 'package:flutter/material.dart';



class RowRoute extends StatelessWidget {

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
             child: Text("This is a row test view"),
           ),
         ],
       ),
    );
  }
}