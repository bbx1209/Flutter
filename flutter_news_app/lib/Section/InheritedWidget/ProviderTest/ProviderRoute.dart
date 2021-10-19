

import 'package:flutter/material.dart';
import 'package:flutter_news_app/Section/InheritedWidget/InheritedProvider.dart';
import 'package:flutter_news_app/Section/InheritedWidget/ProviderTest/Cart.dart';

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({Key? key}) : super(key: key);

  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderRoute"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context){
            return Column(
              children: [
                Builder(builder: (context){
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价:${cart.totalPrice}");},),

                Builder(builder: (context) {
                  return TextButton(child: Text("添加商品"), onPressed: (){
                    ChangeNotifierProvider.of<CartModel>(context).add(Item(10, 1));
                  });
                }
                ),
              ],
            );
          },),
        ),
      )
    );
  }
}
