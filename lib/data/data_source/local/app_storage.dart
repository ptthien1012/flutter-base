import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:hive/hive.dart';

class AppStorage {
  AppStorage.init() {
    AppStorage._();
  }
  AppStorage._();
  static const _box = 'PrefBox';

  Future<AppPref> prefHelper() async {
    try {
      final openBox = await Hive.openBox<dynamic>(_box);
      return AppPref(prefBox: openBox);
    } catch (e) {
      rethrow;
    }
  }
}
