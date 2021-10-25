
import 'package:flutter/material.dart';

class PageViewRoute extends StatefulWidget {
  const PageViewRoute({Key? key}) : super(key: key);

  @override
  _PageViewRouteState createState() => _PageViewRouteState();
}

class _PageViewRouteState extends State<PageViewRoute> {
  var pages = <Page>[];
  @override
  void initState() {
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      pages.add( Page( text: '$i'));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageViewRoute"),
      ),
      body: PageView(
        // allowImplicitScrolling: true,
        children: pages,
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(
      child: Text("${widget.text}", textScaleFactor: 5,),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

