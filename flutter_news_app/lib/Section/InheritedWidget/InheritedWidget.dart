


import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({Key ? key ,required this.data, required Widget child})
  : super(key: key, child: child);

  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }
  final int data;
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

}

class TextWithShareDateWidget extends StatefulWidget {
  const TextWithShareDateWidget({Key? key}) : super(key: key);

  @override
  _TextWithShareDateWidgetState createState() => _TextWithShareDateWidgetState();
}

class _TextWithShareDateWidgetState extends State<TextWithShareDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
