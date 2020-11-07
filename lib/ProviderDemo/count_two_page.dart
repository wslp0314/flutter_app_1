import 'package:flutter/material.dart';
import 'package:flutter_app_1/ProviderDemo/count_model.dart';
import 'package:provider/provider.dart';
class CountTwoPage extends StatefulWidget {
  int num;
  CountTwoPage({this.num = 0});
  @override
  _CountTwoPageState createState() => _CountTwoPageState();
}

class _CountTwoPageState extends State<CountTwoPage> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterModel>(context).count;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider第二页"),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text("${counter}"),
            ),
            Positioned(child: InkWell (
              onTap: () {
                setState(() {
                  print("什么狗几把");
                });

              },
              child: Icon(Icons.add_box_outlined),
            ))
          ],


        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
