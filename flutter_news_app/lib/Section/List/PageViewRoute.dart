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
      pages.add(Page(text: '$i'));
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
      child: Text(
        "${widget.text}",
        textScaleFactor: 5,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
//MARK: ----- AutomaticKeepAliveClientMixin class  ------
// 包装 缓存类
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({Key? key, this.keepAlive = true, required this.child})
      : super(key: key);

  final bool keepAlive;
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }


 @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}


// route

class KeepAliveRoute extends StatelessWidget {
  const KeepAliveRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KeepAliveRoute"),
      ),
      body: ListView.builder(itemBuilder: (_, index){
        // return ListItem(index: index);
        return KeepAliveWrapper(keepAlive: false,child: ListItem(index: index,));
      }),
    );
  }
}


//item

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text("${widget.index}"),);
  }
  @override
  void dispose() {
    print("dispose ${widget.index}");
    super.dispose();
  }
}

