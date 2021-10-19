

import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/Section/InheritedWidget/InheritedProvider.dart';

class Item {

  double price;
  int count;

  Item(this.price, this.count);
}


class CartModel extends ChangeNotifier {

  final List<Item> _items =  [];
// 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (previousValue, element) => previousValue + element.count*element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class Consumer<T> extends StatelessWidget {
   Consumer({Key? key, required this.builder}) : super(key: key);

   final Widget Function(BuildContext context,T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context)
    );
  }
}
