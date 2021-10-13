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
            TextButton(
                onPressed: () {
                  isChinese(context);
                },
                child: Text("is")),
            TextButton(
                onPressed: () {
                  isPerson(context);
                },
                child: Text("is person")),
            TextButton(
                onPressed: () {
                  asPerson(context);
                },
                child: Text("as person")),
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

  void isPerson(BuildContext context) {
    var chinese = Chinese();
    if (chinese is Person) {
      Toast.show(" 是人类", context);
    }
  }

  void asPerson(BuildContext context) {
    var chinese = Chinese();
    (chinese as Chinese).nationality = "中国国籍";
    Toast.show("${chinese.nationality}", context);
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
