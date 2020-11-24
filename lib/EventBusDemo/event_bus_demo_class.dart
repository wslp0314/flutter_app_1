import 'package:event_bus/event_bus.dart';
import 'package:flutter_app_1/Comment/Global.dart';

//Bus初始化
EventBus eventBus = EventBus();

class FuckingChangePageText {
  String text;
  FuckingChangePageText(String text){
    this.text = "$text 增加了 ${Global.index} 次";
    Global.index++;
  }
}