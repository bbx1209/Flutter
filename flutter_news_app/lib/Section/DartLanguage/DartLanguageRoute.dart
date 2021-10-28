import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:toast/toast.dart';

class DartLanguageRoute extends StatelessWidget {
  const DartLanguageRoute({Key? key}) : super(key: key);

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
            TextButton(
                onPressed: () {
                  var writer = Writer();
                  writer.makeMoney();
                },
                child: Text("mixins ")),
            TextButton(
                onPressed: () async {
                  print("start");
                   asyncFunction();
                  syncFunction();
                  print("end");
                },
                child: Text("sync and async")),
          ],
        ),
      ),
    );
  }

  void isChinese(BuildContext context) {
    var chinese = Chinese();
    if (chinese is Chinese) {
      // Toast.show(" 是中国人 ", context);
    }
  }

  void isPerson(BuildContext context) {
    var chinese = Chinese();
    if (chinese is Person) {
      // Toast.show(" 是人类", context);
    }
  }

  void asPerson(BuildContext context) {
    var chinese = Chinese()..nationality = "sasdfa";
    (chinese as Chinese).nationality = "中国国籍";
    // Toast.show("${chinese.nationality}", context);
  }
}

class Person {
  String? name;
  int? age;
  String? address;
  String? phone;
}

class Chinese extends Person {
  String? nationality;

  Chinese();

  Chinese.create() : nationality = "China";
}

class Writer extends Person with work {
  @override
  void makeMoney() {
    super.makeMoney();
    print("writing");
  }
}

mixin work {
  String? job;
  double? salary;

  void makeMoney() {
    print("makemoney by:");
  }
}

class PersonII {
  final String _name;

  PersonII(this._name);

  String greet(String who) => 'Hello, $who, I am $_name';
}

class Impostor implements PersonII {
  String get _name => '';

  @override
  String greet(String who) => 'Hi, $who, Do you know my name';
}

String greetBob(PersonII person) => person.greet('Bob');

//MARK: ---- mixin ----
class Musician {
  void playMusic() {}
}

//生命只能 mixin 在 特定的类
mixin MusicalPerformer on Musician {
  void useSomeMerchine() {
    playMusic(); //使用的是 Musician 的方法
  }
}

class Singer extends Musician with MusicalPerformer {
  @override
  void useSomeMerchine() {
    super.useSomeMerchine();
  }
}

void syncFunction() {
  print("syncFunction");
}

Future<void> asyncFunction() async {
  sleep(Duration(seconds: 2));
  print("async function");
}
