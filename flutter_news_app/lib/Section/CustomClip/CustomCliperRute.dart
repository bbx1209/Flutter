import 'package:flutter/material.dart';

class CustomClipRoute extends StatefulWidget {
  const CustomClipRoute({Key key}) : super(key: key);

  @override
  _CustomClipRouteState createState() => _CustomClipRouteState();
}

class _CustomClipRouteState extends State<CustomClipRoute> {
  final Image _image = Image.asset("images/mao.png", width: 60, height: 60.0, fit: BoxFit.fill,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomClipRoute"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: ClipRect(
                    clipper: MyClipper(),
                    child: _image,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
