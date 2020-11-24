import 'package:flutter/material.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_demo_class.dart';
class CreateEventBusPageOne extends StatefulWidget {
  @override
  _CreateEventBusPageOneState createState() => _CreateEventBusPageOneState();
}

class _CreateEventBusPageOneState extends State<CreateEventBusPageOne> {

  String text = "第一页没有数据";
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
      color: Colors.red,
      child: Text(text),
    );
  }
}