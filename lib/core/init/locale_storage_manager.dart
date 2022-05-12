import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorageManager {
  static final LocaleStorageManager _instance = LocaleStorageManager._init();

  SharedPreferences? _preferences;
  static LocaleStorageManager get instance => _instance;

  LocaleStorageManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  static void preferencesInitReady(SharedPreferences preferences) async {
    instance._preferences = preferences;
  }

  Future<bool> clear() async {
    return await _preferences!.clear();
  }

  Future<bool> clearWithoutFirstLogin() async {
    await clear();
    await setBooleanValue(StorageKeys.firstLoginApp, false);
    return true;
  }

  Future<bool> isAuthorized() async {
    if (contains(StorageKeys.token) && contains(StorageKeys.user)) {
      return true;
    }
    return false;
  }

  Future<void> setStringValue(StorageKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setIntegerValue(StorageKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> setBooleanValue(StorageKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  setList(List<String> company) {
    _preferences!.setStringList(StorageKeys.companyList.toString(), company);
  }

  List<String> getList(StorageKeys key) {
    List<String> list = _preferences?.getStringList(key.toString()) ?? [];
    return list;
  }

  String getStringValue(StorageKeys key) => _preferences!.getString(key.toString()) ?? '';
  bool getBoolValue(StorageKeys key) => _preferences!.getBool(key.toString()) ?? true;
  int getIntegerValue(StorageKeys key) => _preferences!.getInt(key.toString()) ?? 0;
  bool contains(StorageKeys key) => _preferences!.containsKey(key.toString());
}

enum StorageKeys {
  expire,
  token,
  firstLoginApp,
  user,
  companyList,
}
