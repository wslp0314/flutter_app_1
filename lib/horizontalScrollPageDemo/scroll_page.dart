import 'package:flutter/material.dart';
import 'package:flutter_app_1/extended_tabs/extended_tabs.dart';
import 'package:flutter_app_1/extended_tabs/src/custom_tab_bar.dart';
import 'package:tabbar_magic_indicator/tabbar_magic_indicator.dart';
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
    tabController2 = TabController(length: 12, vsync: this);
    super.initState();
  }


  // tab
  Widget _buildTabChildWidget(String text ) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    var tabNameList = ['热销1','热销2','热3','热销4',];
    var tabNameList1 = ['热销1','热销2','热3','热销4','热销1','热销2','热3','热销4','热销1','热销2','热3','热销4',];

    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30,0, 30, 0),
            child: CustomTabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white.withOpacity(0.85),
              indicatorSize: CustomTabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey.withOpacity(0.65),
              labelPadding: EdgeInsets.all(0),
              tabs: tabNameList.map<Widget>((text) =>
                  // _buildTabChildWidget(text)
              MagicTab(text: text,tabHeight: 25,)

              ).toList(),
            ),
          ),
          // TabBar(
          //   indicator: ColorTabIndicator(Colors.red),
          //   labelColor: Colors.black,
          //   tabs: [
          //     Tab(text: "Tab000"),
          //     Tab(text: "Tab001"),
          //     Tab(text: "Tab002"),
          //     Tab(text: "Tab003"),
          //   ],
          //   controller: tabController,
          // ),
          Text("我是你爸爸",style: TextStyle(color: Colors.white),),
          Expanded(
            child: ExtendedTabBarView(
              children: <Widget>[
                List("Tab000"),
                Column(
                  children: <Widget>[
                    CustomTabBar(
                      controller: tabController1,
                      indicatorColor: Colors.blue,
                      labelColor: Colors.white.withOpacity(0.85),
                      indicatorSize: CustomTabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.blue.withOpacity(0.65),
                      labelPadding: EdgeInsets.all(0),
                      tabs: tabNameList.map<Widget>((text) =>
                          MagicTab(text: text,tabHeight: 25,)
                      ).toList(),
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

                    CustomTabBar(
                      isScrollable: true,
                      controller: tabController2,
                      indicatorColor: Colors.blue,
                      labelColor: Colors.grey.withOpacity(0.85),
                      indicatorSize: CustomTabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.black.withOpacity(0.65),
                      labelPadding: EdgeInsets.all(3),
                      tabs: tabNameList1.map<Widget>((text) =>
                          // _buildTabChildWidget(text)
                        MagicTab(text: text,tabHeight: 25,)
                      ).toList(),
                    ),
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          List("Tab000"),
                          List("Tab001"),
                          List("Tab002"),
                          List("Tab003"),
                          List("Tab000"),
                          List("Tab001"),
                          List("Tab002"),
                          List("Tab003"),
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
      ),
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