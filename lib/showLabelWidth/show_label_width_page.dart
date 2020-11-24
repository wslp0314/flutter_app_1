import 'package:flutter/material.dart';

class ShowLabelWidthPage extends StatefulWidget {
  @override
  _ShowLabelWidthPageState createState() => _ShowLabelWidthPageState();
}

class _ShowLabelWidthPageState extends State<ShowLabelWidthPage> {
  double widthTemp;

  @override
  Widget build(BuildContext context) {
    cauculterWidth();

    return Container(
      width: double.infinity,

      child: Column (
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
                child: Center(
                  child: Text("zengjai da",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                ),
              ),),
              Expanded(child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.yellow,
                child: Center(
                  child: Text("za",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                ),
              ),),
              Expanded(child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text("zengjai dqqweqa",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                ),
              ),),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.green,
                width: widthTemp,
                height: 100,
              ),
              Text("哈哈哈"),
            ],
          )


        ],
      ),
    );
  }

  

  void cauculterWidth ()  {
    Size size1 = getTextSize("zengjai da", TextStyle(fontSize: 12,fontWeight: FontWeight.w600));
    Size size2 = getTextSize("za", TextStyle(fontSize: 12,fontWeight: FontWeight.w100));
    Size size3 = getTextSize("zengjai dqqweqa", TextStyle(fontSize: 12,fontWeight: FontWeight.w900));

    print(size1.width);
    print(size2.width);
    print(size3.width);
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;
    print(height);
    print(width/6-size1.width/2);

    widthTemp = width/6-size1.width/2;










  }
  

  Size getTextSize(String text, TextStyle style) {
    TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '...',
    );
    painter.layout();
    return painter.size;
  }

}
