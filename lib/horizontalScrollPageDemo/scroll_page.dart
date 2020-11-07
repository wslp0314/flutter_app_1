import 'package:flutter/material.dart';
import 'package:flutter_app_1/extended_tabs/extended_tabs.dart';

class ScrollPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScrollPageState();
}


class ScrollPageState extends State<ScrollPage> with TickerProviderStateMixin {
  TabController tabController;
  TabController tabController1;
  TabController tabController2;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController1 = TabController(length: 4, vsync: this);
    tabController2 = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          indicator: ColorTabIndicator(Colors.red),
          labelColor: Colors.black,
          tabs: [
            Tab(text: "Tab000"),
            Tab(text: "Tab001"),
            Tab(text: "Tab002"),
            Tab(text: "Tab003"),
          ],
          controller: tabController,
        ),
        Expanded(
          child: ExtendedTabBarView(
            children: <Widget>[
              List("Tab000"),
              Column(
                children: <Widget>[
                  TabBar(
                    indicator: ColorTabIndicator(Colors.yellow),
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "Tab000"),
                      Tab(text: "Tab001"),
                      Tab(text: "Tab002"),
                      Tab(text: "Tab003"),
                    ],
                    controller: tabController1,
                  ),
                  Expanded(
                    child: ExtendedTabBarView(
                      children: <Widget>[
                        List("Tab000"),
                        List("Tab001"),
                        List("Tab002"),
                        List("Tab003"),
                      ],
                      controller: tabController1,

                      ///if linkedParentTabBarView is true and current tabbarview over scroll,
                      ///it will check whether ancestor tabbarView can be scroll
                      ///then scroll ancestor tabbarView
                      linkWithAncestor: true,

                      /// cache page count
                      /// default is 0.
                      /// if cacheExtent is 1, it has two pages in cache
                      /// null is infinity, it will cache all pages
                      cacheExtent: 1,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TabBar(
                    indicator: ColorTabIndicator(Colors.blue),
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "Tab000"),
                      Tab(text: "Tab001"),
                      Tab(text: "Tab002"),
                      Tab(text: "Tab003"),
                    ],
                    controller: tabController2,
                  ),
                  Expanded(
                    child: ExtendedTabBarView(
                      children: <Widget>[
                        List("Tab000"),
                        List("Tab001"),
                        List("Tab002"),
                        List("Tab003"),
                      ],
                      controller: tabController2,

                      ///if linkedParentTabBarView is true and current tabbarview over scroll,
                      ///it will check whether ancestor tabbarView can be scroll
                      ///then scroll ancestor tabbarView
                      linkWithAncestor: true,

                      /// cache page count
                      /// default is 0.
                      /// if cacheExtent is 1, it has two pages in cache
                      /// null is infinity, it will cache all pages
                      cacheExtent: 1,
                    ),
                  )
                ],
              ),
              List("Tab003"),
            ],
            controller: tabController,
          ),
        )
      ],
    );

  }
}




class List extends StatelessWidget {
  final String tabKey;
  List(this.tabKey);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (c, i) {
          return Container(
            //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
            alignment: Alignment.center,
            height: 60.0,
            child: Text("$tabKey : List$i"),
          );
        },
        itemCount: 100);
  }
}