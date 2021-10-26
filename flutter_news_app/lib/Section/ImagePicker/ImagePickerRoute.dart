

import 'package:flutter/material.dart';

class ImagePickerRoute extends StatefulWidget {
  const ImagePickerRoute({Key? key}) : super(key: key);

  @override
  _ImagePickerRouteState createState() => _ImagePickerRouteState();
}

class _ImagePickerRouteState extends State<ImagePickerRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePickerRoute"),
      ),
    );
  }
}
