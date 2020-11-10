import 'package:flutter/material.dart';
import 'package:flutter_app_1/extended_tabs/src/custom_tab_bar.dart';
import 'package:flutter_app_1/horizontalScrollPageDemo/scroll_item.dart';

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

  // tab
  Widget _buildTabChildWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    List tabNameList = ['热销1','热销2','热3','热销4',];
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: CustomTabBar(
          controller: this._tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue.withOpacity(0.85),
          indicatorSize: CustomTabBarIndicatorSize.label,
          unselectedLabelColor: Colors.white.withOpacity(0.65),
          labelPadding: EdgeInsets.all(0),
          tabs: tabNameList.map<Widget>((text) =>
              _buildTabChildWidget(text)
          ).toList(),
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(child: Text("热销")),
          ScrollItem(),
          ScrollItem(),
          Center(child: Text("推荐")),
        ],
      ),
    );
  }

}
