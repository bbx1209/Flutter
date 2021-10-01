import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ButtonRoute extends StatelessWidget {
  const ButtonRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ButtonRoute"),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Toast.show("text button clicked", context);
                },
                child: Text("text button"),
              ),
              TextButton.icon(onPressed: (){}, icon: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child:  Image.asset("images/1.png"),
              ), label: Text("text icon button")),
              ElevatedButton(onPressed: (){}, child: Text("elevated button ")),
              ElevatedButton.icon(onPressed: (){}, icon: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child:  Image.asset("images/1.png"),
              ), label: Text(""))
            ],
          ),
        ));
  }
}
