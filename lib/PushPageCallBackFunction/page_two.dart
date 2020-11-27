import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  final function;

  const PageTwo({Key key, this.function}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(

          child: Center(
            child: InkWell(
              onTap: () {
                widget.function();
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Text("运行首页的方法"),
              ),
            ),
          ),

        )

    );
  }
}
