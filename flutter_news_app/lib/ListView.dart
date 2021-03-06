import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
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
//        child: InfinitedListView(),
      child: CollectionView(),
      ),

      bottomNavigationBar: BottomAppBar (

        child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: IconButton(icon: const Icon(Icons.menu), onPressed: (){
                  print("press menu");
                },color: Colors.blue,),
              ) ,
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: IconButton(icon: const Icon(Icons.add), onPressed: (){
                  print("press add");
                } ,color: Colors.blue,),
              ),
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
      //??????????????????
      if (_words[index] == loadingTag) {
        //??????100????????????????????????
        if (_words.length - 1 < 100) {
          //????????????
          _retrieveData();
          //???????????????loading
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
          //???????????????100?????????????????????????????????
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text("???????????????", style: TextStyle(color: Colors.grey),)
          );
        }
      }
      //?????????????????????
      return ListTile(title: Text(_words[index]));
    }, separatorBuilder: (context, index)=>Divider(height: .0,), itemCount: _words.length);
  }

}


class CollectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0
      ),
      children: [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),

        Icon(Icons.beach_access),

        Icon(Icons.cake),

        Icon(Icons.free_breakfast),
        
        TextButton(onPressed: (){
          print("click button");
        }, child: Text("Click")),

        ItemButton(title: "Item1"),
        ItemButton(title: "Item2"),

      ],
      
    );
  }
}

class ItemButton extends StatelessWidget {

  ItemButton({
    Key? key,
    @required this.title
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      _selectedItem(this);
      selectedAItem();
//  _selectedItemTitle(this.title);
    }, child: Text("$title"));
  }

  void selectedAItem() {
    print(this.title);
  }

}

void _selectedItem(ItemButton item) {
  print("${item.title}");
// print(item.title);
}

void _selectedItemTitle(String title) {
  print(title);
}


