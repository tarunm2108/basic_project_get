import 'package:get_storage/get_storage.dart';

const String keyLocation = 'keyLocation';

class SharedPre {
  static final SharedPre instance = SharedPre._internal();

  factory SharedPre() => instance;

  SharedPre._internal();

  ///Keys
  static const loginUser = 'loginUser';
  static const isLogin = 'isLogin';
  static const deviceToken = 'deviceToken';
  final storage = GetStorage();

  Future<void> setValue(String key, dynamic value) async {
    return storage.write(key, value);
  }

  String getStringValue(String key, {String? defaultValue}) {
    return storage.read<String>(key) ?? defaultValue ?? '';
  }

  bool getBoolValue(String key, {bool defaultValue = false}) {
    return storage.read<bool>(key) ?? false;
  }

  int getIntValue(String key, {int? defaultValue}) {
    return storage.read<int>(key) ?? defaultValue ?? -1;
  }

  double getDoubleValue(String key, {double? defaultValue}) {
    return storage.read<double>(key) ?? defaultValue ?? -1;
  }

  Future<void> clearAll() async {
    return await storage.erase();
  }

  // Future<void> setLoginUser(LoginUser? user) async {
  //   if(user != null) {
  //     storage.write(loginUser, user.toJson());
  //   }
  // }
  //
  // LoginUser? getLoginUser() {
  //   try {
  //     final data = storage.read<Map<String, dynamic>>(loginUser) ?? {};
  //     if (data.isNotEmpty) {
  //       return LoginUser.fromJson(data);
  //     }
  //     return null;
  //   } catch (e) {
  //     Logger.instance.printError("getLoginUser $e");
  //     return null;
  //   }
  // }
}
