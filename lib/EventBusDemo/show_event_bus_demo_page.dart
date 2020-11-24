import 'package:flutter/material.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_demo_class.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_page_one.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_page_three.dart';
import 'package:flutter_app_1/EventBusDemo/event_bus_page_two.dart';

class showEventBusDemoPage extends StatefulWidget {
  @override
  _showEventBusDemoPageState createState() => _showEventBusDemoPageState();
}

class _showEventBusDemoPageState extends State<showEventBusDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print("更改  三个页面的数据 ");
            eventBus.fire(FuckingChangePageText("都尼玛给我改数据"));
          },
          child: Icon(Icons.info),
        ),

        CreateEventBusPageOne(),
        CreateEventBusPageTwo(),
        CreateEventBusPageThree(),



        InkWell(
          onTap: () {
            print("更改  三个页面的数据 ");
            eventBus.fire(FuckingChangePageText("都尼玛给我改数据"));
          },
          child: Icon(Icons.info),
        ),


      ],
    );

  }
}
