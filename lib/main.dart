import 'dart:html';

import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';

  // InheritedWidget
  // MediaQuery()



  // Notification
  // Eventbus



  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('init'),
              onPressed: () {
                init();
              },
            ),
            RaisedButton(
              child: Text("bind"),
              onPressed: () {
                bind();
              },
            )
          ],
        ),
      ),
    );
  }

  void init() async {
  }
  void bind() async {
  }

  ///添加监听器
  void addListener() {


  }
}
