
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil{
  // 保存数据
  static Future set(key, value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }
  // 获取数据
  static Future get(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.get(key);
  }
  // 清除数据
  static Future delete(key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}