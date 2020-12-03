import 'package:flutter/material.dart';
import 'package:flutter_app_1/ProviderPartOfDemo/time_model.dart';
import 'package:provider/provider.dart';

class CountDownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("短信倒计时"),
          ),
          body: Center(
            child: ChangeNotifierProvider<TimerModel>(
              create: (context) => TimerModel(),
              child: Consumer<TimerModel>(builder: (context, timerModel, _) {
                return RaisedButton(
                  onPressed: () async {
                    if (timerModel.count == 0) {
                      timerModel.startTimer();
                    }
                  },

                  child: Text(
                    timerModel.count == 0 ? "获取验证码" : '${timerModel.count} 秒后重发',
                    style: timerModel.count == 0
                        ? TextStyle(color: Colors.blue, fontSize: 14)
                        : TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                );
              }),
            ),
          ),
        )
    );
  }
}