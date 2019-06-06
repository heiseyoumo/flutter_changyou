import 'package:shared_preferences/shared_preferences.dart';

/*sharedPreference存储是一个轻量级的耗时操作,所以我们需要在异步中进行因此需要再方法后面加上await和async关键字*/
class SharedPreferencesDataUtils {
  // 保存数据
  Future setUserInfo(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value is String) {
      sp.setString(key, value);
    } else if (value is int) {
      sp.setInt(key, value);
    }
  }

  // 获取数据
  Future<dynamic> getUserInfo(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.get(key);
  }

  // 清除数据
  Future deleteUserInfo(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  /*清楚所有的键值对*/
  Future clearAllKey() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
