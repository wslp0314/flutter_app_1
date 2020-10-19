import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_1/user_bean.dart';
/*
class UserInfoWidget extends InheritedWidget {
  final UserBean userBean;

  UserInfoWidget({this.userBean,Key key,Widget child}):super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget old) {
    if(old.userBean.name != userBean.name){

    }
    return old.userBean  != userBean;
  }

}*/

class UserInfoWidget extends InheritedWidget {

  // 共享状态
  final String data;
  // 修改共享状态方法
  // final Function onDataChange;
  // 生成构造函数
  UserInfoWidget({
    Key key,
    Widget child,
    this.data,
    // @required this.onDataChange,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(UserInfoWidget old) {
    //判断依赖的 data 状态是否变化
    return old.data != data;
  }
}