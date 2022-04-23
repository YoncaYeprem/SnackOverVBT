class LocaleManager {
  String? token;
  bool isLogin = false;

  void saveToken(String data) {
    token = data;
  }

  void clearData() {
    _changeLoginValue(false);
  }

  void _changeLoginValue(bool value) {
    isLogin = value;
  }
}
