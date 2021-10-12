
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DartLanguageRoute extends StatelessWidget {
  const DartLanguageRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DartLanguageRoute"),
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
  void isChinese(BuildContext context) {
    var chinese = Chinese();
    if (chinese is Chinese) {
      Toast.show(" 是中国人 ", context);
    }
  }
}





class Person {
  String name;
  int age;
  String address;
  String phone;
}

class Chinese extends Person {
  String nationality;
}


