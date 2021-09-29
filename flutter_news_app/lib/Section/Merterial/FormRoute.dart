import 'package:flutter/material.dart';

class FormRoute extends StatefulWidget {
  const FormRoute({Key key}) : super(key: key);

  @override
  _FormRouteState createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {
  TextEditingController _editingController = TextEditingController();
  TextEditingController _secureEC = TextEditingController();
  TextEditingController _defaultEC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController.addListener(() {
      print("${_editingController.text}");
    });
    _secureEC.addListener(() {
      print("${_secureEC.text}");
    });

    _defaultEC.text = "阿斯顿发的发";
    _defaultEC.selection =
        TextSelection(baseOffset: 2, extentOffset: _defaultEC.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormRoute"),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名或者邮箱",
                prefixIcon: Icon(Icons.person)),
            controller: _editingController,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输密码",
                prefixIcon: Icon(Icons.lock)),
            // obscureText: true,
            keyboardType: TextInputType.numberWithOptions(),
            keyboardAppearance: Brightness.light,
            controller: _secureEC,
          ),
          TextField(
            decoration:
                InputDecoration(labelText: "默认值", prefixIcon: Icon(Icons.lock)),
            controller: _defaultEC,
          ),
          Center(
            child: Column(
              children: [
                TextButton(
                  child: Text("移动焦点"),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
