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
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top:4.0, right: 5),
                   child: Text("row 1"),
                 ),
                 //NOTE: 折行或者ellipsis 需要用Expanded
                 Expanded(
                     child : Text("row 2  当然水电费阿斯蒂芬阿斯蒂芬阿斯蒂芬阿是的分公司电饭锅34曲儿复工IQ鹅fad手动阀是的分公司电饭锅是梵蒂冈肉好热乎归属地仁恒国际",
                       overflow: TextOverflow.ellipsis,
                       maxLines: 2,
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
    // 头像
    Widget avatar = Image.asset("images/1.png", width: 60.0);
    return Scaffold(
        appBar: AppBar(
        title: Text("image "),
    ),

      body:
        Padding (
          padding: EdgeInsets.all(25),
          child:  Center (
            child: Column (
              children: [
                avatar,
                Image.network("https://car0.autoimg.cn/upload/spec/4945/u_20120220072722314264.jpg", width: 200,height: 200,),


                ClipRRect (
                 borderRadius: BorderRadius.circular(15.0),
                  child: avatar,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25,bottom: 25),
                  child: ClipOval(
                    child: avatar,

                  ),
                ),
                avatar,
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRect(
                        child:  Align(
                          alignment: Alignment.topLeft,
                          widthFactor: 0.5,
                          child: avatar,
                        ),
                      ),

                      Text("右边边的文字！")
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          widthFactor: 0.5,
                          child: avatar,
                        ),
                        Text("右边边的文字！", style: TextStyle(color: Colors.red),)
                      ],
                    ),

                ),




              ],
            ),
          ),

        )


    );
  }

}
