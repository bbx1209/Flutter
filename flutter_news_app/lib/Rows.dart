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
                 //NOTE: 折行或者ellipsis 需要用Expanded
                 Expanded(
                     child : Text("row 2  当然水电费阿斯蒂芬阿斯蒂芬阿斯蒂芬阿是的分公司电饭锅34曲儿复工IQ鹅肉好热乎归属地仁恒国际",
                       overflow: TextOverflow.ellipsis,
                     ),
                   )

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


class ImageRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("image "),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [

            Center(
               child: Image(
                    image: AssetImage("images/1.png"),
                    width: 50
                )
            )

          ],
        ),
      ),
    );
  }

}