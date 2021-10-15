
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TextRoute extends StatelessWidget {
  TextRoute({Key? key}) : super(key: key);
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("simple text"),
            Text("simple text",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    backgroundColor: Colors.black26)),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Text span"),
              TextSpan(
                  text: "12131313",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      Toast.show("12131313", context);
                    })
            ])),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 6, right: 25),
              child:Text("simple text"* 11,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,))
            ,
          ],
        ),
      ),
    );
  }
}