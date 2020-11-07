
import 'package:flutter/material.dart';
import 'package:flutter_app_1/ProviderDemo/count_model.dart';
import 'package:flutter_app_1/TabControllerAndPageView/tab_controller_and_page_view.dart';
import 'package:flutter_app_1/home_page.dart';

import 'package:provider/provider.dart';

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

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('woshinibaba'),
        ),
        body: TabControllerAndPageView(),
      ),
    );
  }




}
