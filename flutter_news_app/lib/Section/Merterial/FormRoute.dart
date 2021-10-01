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
  FocusNode _node1 = FocusNode();
  FocusNode _node2 = FocusNode();
  FocusScopeNode _scopeNode;
  GlobalKey _globalKey = GlobalKey<FormState>();

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
            focusNode: _node1,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                labelText: "密码",
                hintText: "请输密码",
                prefixIcon: Icon(Icons.lock)),

            // obscureText: true,
            keyboardType: TextInputType.numberWithOptions(),
            keyboardAppearance: Brightness.light,
            controller: _secureEC,
            focusNode: _node2,
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
                  onPressed: () {
                    if (null == _scopeNode) {
                      _scopeNode = FocusScope.of(context);
                    }
                    _scopeNode.requestFocus(_node2);
                  },
                ),
                TextButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    _node1.unfocus();
                    _node2.unfocus();
                  },
                ),
              ],
            ),
          ),
          Builder(builder: (cnt) {
            return Column(
              children: [
                Theme(
                    data: Theme.of(cnt).copyWith(
                        hintColor: Colors.grey[200],
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(color: Colors.grey),
                            //定义label字体样式
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                            )),
                    child: Column(
                      children: [
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: "用户名",
                              hintText: "请输入用户名或者邮箱",
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ],
                    ))
              ],
            );
          }),
          Builder(builder: (cnt) {
            return Form(
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person),
                    ),
                    // 校验用户名
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    },
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
