import 'package:flutter_base/data/data_source/local/pref/pref_helper.dart';
import 'package:hive/hive.dart';

class AppPref extends PrefHelper {
  static const _firstRunKey = "first_run_key";
  static const _tokenKey = "token_key";
  // static const _userKey = "user_key";

  final Box _prefBox;
  AppPref({required Box prefBox}) : _prefBox = prefBox;

  @override
  Future<bool> firstRun() {
    return _prefBox.get(_firstRunKey) ?? true;
  }

  @override
  Future<void> setFirstRun(bool isFirstRun) async {
    await _prefBox.put(_firstRunKey, isFirstRun);
  }

  @override
  Future<String?> getToken() {
    return _prefBox.get(_tokenKey);
  }

  @override
  Future<void> setToken(String token) async {
    await _prefBox.put(_tokenKey, token);
  }
}
