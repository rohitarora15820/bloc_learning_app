import 'package:learning_app/common/entities/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

    Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppContatnts.STORAGE_DEVICE_FIRST_OPEN) ?? false;
  }

  bool getisLoggedIn(){
    return _prefs.getString(AppContatnts.STORAGE_USER_TOKEN_KEY)== null?false:true;
  }

   Future<bool> remove(String key){
    return _prefs.remove(key);
   }
}
