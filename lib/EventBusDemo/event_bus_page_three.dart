import 'package:flutter/material.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_demo_class.dart';
class CreateEventBusPageThree extends StatefulWidget {
  @override
  _CreateEventBusPageThreeState createState() => _CreateEventBusPageThreeState();
}

class _CreateEventBusPageThreeState extends State<CreateEventBusPageThree> {
  String text = "第三页没有数据";

  void _listen() {
    eventBus.on<FuckingChangePageText>().listen((event) {
      setState(() {
        text = event.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child: Text(text),
    );
  }
}
