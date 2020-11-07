import 'package:flutter/material.dart';

class TabControllerAndPageView extends StatefulWidget {
  TabControllerAndPageView({Key key}) : super(key: key);

  @override
  _TabControllerAndPageViewState createState() => _TabControllerAndPageViewState();
}

// 1 实现 SingleTickerProviderStateMixin
class _TabControllerAndPageViewState extends State<TabControllerAndPageView>
    with SingleTickerProviderStateMixin {
  // 2 定义 TabController 变量
  TabController _tabController;

  // 3 覆盖重写 initState，实例化 _tabController

  @override
  void initState() {
    super.initState();
    _tabController=new TabController(
        vsync: this,
        length: 4
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text:"热销"),
            Tab(text:"推荐"),
            Tab(text:"热销"),
            Tab(text:"推荐"),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(child: Text("热销")),
          Center(child: Text("推荐")),
          Center(child: Text("热销")),
          Center(child: Text("推荐")),
        ],
      ),
    );
  }

}
