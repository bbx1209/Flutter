


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderRoute extends StatefulWidget {
  const PathProviderRoute({Key? key}) : super(key: key);

  @override
  _PathProviderRouteState createState() => _PathProviderRouteState();
}

class _PathProviderRouteState extends State<PathProviderRoute> {
  int _counter = 0;

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.text');
  }
  Future<int> _readCount() async {
    try {
      File file = await _getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } on FileSystemException {
      print("there is an error");
      return 0;
    }

  }
  
  _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readCount().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PathProviderRoute"),
      ),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
