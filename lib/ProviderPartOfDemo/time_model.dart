import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TimerModel extends ChangeNotifier{

  StreamSubscription _subscription;
  int _count = 0;///当前计数

  int get count => 10 - _count;///剩余时间

  _setCount(){
    _count++;
    notifyListeners();
  }

  startTimer(){
    _count = 0;

    _subscription = Stream.periodic(Duration(seconds: 1))
        .startWith(10)
        .take(10)
        .listen((t){
      _setCount();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}