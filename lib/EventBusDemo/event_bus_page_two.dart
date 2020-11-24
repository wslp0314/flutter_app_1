import 'package:flutter/material.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_demo_class.dart';
class CreateEventBusPageTwo extends StatefulWidget {
  @override
  _CreateEventBusPageTwoState createState() => _CreateEventBusPageTwoState();
}

class _CreateEventBusPageTwoState extends State<CreateEventBusPageTwo> {
  String text = "第二页没有数据";
  void _listen(){
    eventBus.on<FuckingChangePageText>().listen((event){
      setState(() {
        text = event.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    _listen();
    return  Container(
      height: 100,
      width: 100,
      color: Colors.yellow,
      child: Text(text),
    );
  }
}
