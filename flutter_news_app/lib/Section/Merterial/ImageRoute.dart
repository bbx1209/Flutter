import 'package:flutter/material.dart';

class ImageRoute extends StatelessWidget {
  const ImageRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _image = AssetImage("images/walk1.png");
    return Scaffold(
        appBar: AppBar(
          title: Text("ImageRoute"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: _image,
                height: 50,
                width: 100,
                fit: BoxFit.fill,
              ),
              Image(
                image: _image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
              Image(
                image: _image,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
              Image(
                image: _image,
                height: 50,
                width: 100,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: _image,
                height: 50,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: _image,
                height: 50,
                width: 100,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: _image,
                width: 100,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                repeat: ImageRepeat.repeatY,
              ),
              Image(
                image: _image,
                height: 200,
                width: 100,
                fit: BoxFit.fill,
              ),
            ].map((e) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(9.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(e.fit.toString())
                ],
              );
            }).toList(),
          ),
        )

    );
  }
}
