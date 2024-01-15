import 'package:hive/hive.dart';

import 'pref_helper.dart';

class AppPref extends PrefHelper {
  AppPref({required Box<dynamic> prefBox}) : _prefBox = prefBox;
  static const _firstRunKey = 'first_run_key';
  static const _tokenKey = 'token_key';

  final Box<dynamic> _prefBox;

  @override
  Future<bool> firstRun() {
    return (_prefBox.get(_firstRunKey) ?? true) as Future<bool>;
  }

  @override
  Future<void> setFirstRun({required bool isFirstRun}) async {
    await _prefBox.put(_firstRunKey, isFirstRun);
  }

  @override
  Future<String?>? getToken() {
    return _prefBox.get(_tokenKey) as Future<String?>?;
  }

  @override
  Future<void> setToken(String token) async {
    await _prefBox.put(_tokenKey, token);
  }
}
