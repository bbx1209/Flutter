import 'package:english_words/english_words.dart';
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
        child: InfinitedListView(),
      ),

      bottomNavigationBar: BottomAppBar (

        child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row (
            children: [
              IconButton(icon: const Icon(Icons.menu), onPressed: (){
                print("press menu");
              },color: Colors.blue,) ,
              IconButton(icon: const Icon(Icons.add), onPressed: (){
                print("press add");
              } ,color: Colors.blue,),
            ],
          ),
        ),

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

class InfinitedListView extends StatefulWidget {

  _InfinitedListViewState  createState() => new _InfinitedListViewState();
}

class _InfinitedListViewState extends State<InfinitedListView> {

  static const loadingTag = "##loading##";
  var _words =  <String>[loadingTag];

    @override
  void initState() {
    // TODO: implement initState
      super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(_words.length-1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(itemBuilder: (context, index){
      //如果到了表尾
      if (_words[index] == loadingTag) {
        //不足100条，继续获取数据
        if (_words.length - 1 < 100) {
          //获取数据
          _retrieveData();
          //加载时显示loading
          return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0)
            ),
          );
        } else {
          //已经加载了100条数据，不再获取数据。
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
          );
        }
      }
      //显示单词列表项
      return ListTile(title: Text(_words[index]));
    }, separatorBuilder: (context, index)=>Divider(height: .0,), itemCount: _words.length);
  }

}
