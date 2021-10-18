import 'package:flutter_news_app/Helpers/MethodChannel.dart';

class MyToast {
  static const TOASTMETHODNAME = "toast";

  static final platform2 = MyMethodChannel.platform;

  static Future<Null> show(String text) async{
    await platform2.invokeMethod(TOASTMETHODNAME, text);
  }
}


