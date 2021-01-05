
import 'package:flutter/material.dart';
import 'package:flutter_app_1/ProviderDemo/count_model.dart';
import 'package:flutter_app_1/PushPageCallBackFunction/page_one.dart';
import 'package:flutter_app_1/TabControllerAndPageView/tab_controller_and_page_view.dart';
import 'package:flutter_app_1/home_page.dart';
import 'package:flutter_app_1/showLabelWidth/show_label_width_page.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'EventBusDemo/show_event_bus_demo_page.dart';
import 'ProviderDemo/count_one_page.dart';
import 'horizontalScrollPageDemo/scroll_page.dart';
void main() {
  //使用MultiProvider可以创建多个顶层共享数据
  return

  runApp(
          ChangeNotifierProvider<CounterModel>.value(//ChangeNotifierProvider调用value()方法，里面传出value和child
            value: CounterModel(),//value设置了默认的Counter()
            child: MyApp(),
          )
        //可管理多个Provider
        // MultiProvider(
        //   providers: [
        //     //            ChangeNotifierProvider(create: (_)=>CounterModel()),
        //     // ChangeNotifierProvider.value(value: CounterModel()),
        //            ],
        //   child: MyApp(),
        // ),
      );

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with WidgetsBindingObserver {


  @override
  Widget build(BuildContext context)     {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('woshinibaba'),
        ),
        body: PageOne(),
        // ScrollPage(),
      ),
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("刘璞--" + state.toString());


    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        break;
      case AppLifecycleState.resumed:// 应用程序可见，前台
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        break;
    // case AppLifecycleState.suspending: // 申请将暂时暂停
    //   break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }






}
