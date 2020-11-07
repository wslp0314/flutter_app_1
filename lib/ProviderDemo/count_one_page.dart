import 'package:flutter/material.dart';
import 'package:flutter_app_1/ProviderDemo/count_model.dart';
import 'package:flutter_app_1/ProviderDemo/count_two_page.dart';
import 'package:provider/provider.dart';
class CountOnePage extends StatefulWidget {
  @override
  _CountOnePageState createState() => _CountOnePageState();
}

class _CountOnePageState extends State<CountOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider第一页"),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              children: [
                Expanded(child: Center(

                  child: Text("我是第${Provider.of<CounterModel>(context).count}个你爸爸"),
                ),),
                FlatButton(
                  minWidth: 50,
                  height: 50,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CountTwoPage();
                      }));
                    },
                  child:Icon(Icons.arrow_forward),
                )
              ],
            ),

            Positioned(child: InkWell (
              onTap: () {
                setState(() {
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
          //用Provider.of<Counter>(context).increment();调用Counter()中的increment()方法
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
