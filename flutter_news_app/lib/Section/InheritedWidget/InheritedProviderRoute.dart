
import 'package:flutter/material.dart';

class InheritedProviderRoute extends StatefulWidget {
  const InheritedProviderRoute({Key? key}) : super(key: key);

  @override
  _InheritedProviderRouteState createState() => _InheritedProviderRouteState();
}

class _InheritedProviderRouteState extends State<InheritedProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedProviderRoute"),
      ),
      body: Center(

      ),
    );
  }
}
