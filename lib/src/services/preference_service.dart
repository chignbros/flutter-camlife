import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  SharedPreferences _preferences;

  PreferenceService() {
    init();
  }

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String> getPhone() async {
    return _preferences.getString('phone');
  }

  Future setPrePhone(String phone) async {
    return await _preferences.setString('phone', phone);
  }
}
