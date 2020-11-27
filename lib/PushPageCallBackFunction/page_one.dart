import 'package:flutter/material.dart';
import 'package:flutter_app_1/PushPageCallBackFunction/page_two.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:

        Container(
          child: Center(
            child: InkWell(
              onTap: (){

                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PageTwo(function: showMessage)));
              },
              child: Container(
                height:100,
                width: 100,
                color: Colors.yellow,
                child: Text("跳转下一页"),
              ),
            ),
          ),
        ));


  }

  void showMessage () {
    print("第一页");
  }

}