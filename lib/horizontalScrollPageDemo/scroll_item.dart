import 'package:flutter/material.dart';



class ScrollItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScrollItemState();
}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}

class ScrollItemState extends State<ScrollItem> with SingleTickerProviderStateMixin {
  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);
  List<TabTitle> tabList;
  var currentPage = 0;
  var isPageCanChanged = true;
  var isShow = true;
  @override
  void initState() {
    super.initState();
    initTabData();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.addListener(() {//TabBar的监听
      if (mTabController.indexIsChanging) {//判断TabBar是否切换
        print(mTabController.index);
        onPageChange(mTabController.index, p: mPageController);
      }
    });
  }

  initTabData() {
    tabList = [
      new TabTitle('推荐', 10),
      new TabTitle('热点', 0),
      new TabTitle('社会', 1),
      new TabTitle('娱乐', 2),
      new TabTitle('体育', 3),
      new TabTitle('美文', 4),
      new TabTitle('科技', 5),
      new TabTitle('财经', 6),
      new TabTitle('时尚', 7)
    ];
  }
  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {//判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);//等待pageview切换完毕,再释放pageivew监听3
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index);//切换Tabbar
    }
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Container(
              color: new Color(0xfff4f5f6),
              height: 38.0,
              child: TabBar(
                isScrollable: true,
                //是否可以滚动
                controller: mTabController,
                labelColor: Colors.red,
                unselectedLabelColor: Color(0xff666666),
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: tabList.map((item) {
                  return Tab(
                    text: item.title,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
                // 重新构建
                setState(() {
                  print("滚动的百分比: $progress");
                  if (progress == 1) {
                    isShow = false;
                  } else {
                    isShow = true;
                  }
                });
                print("BottomEdge: ${notification.metrics.extentAfter == 0}");
                },
                child:PageView.builder(
                  itemCount: tabList.length,
                  onPageChanged: (index) {
                    if (isPageCanChanged) {//由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                      onPageChange(index);
                    }
                  },
                  controller: mPageController,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(tabList[index].title);
                  },
                ),
            )
        ),
      ],
    ),
        Offstage(
          offstage: isShow,
          child: Container(
            color: Colors.yellow,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );


  }
}