import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:hive/hive.dart';

class AppStorage {
  static const _box = 'PrefBox';

  AppStorage._();

  static AppStorage init() {
    return AppStorage._();
  }

  Future<AppPref> prefHelper() async {
    try {
      final openBox = await Hive.openBox(_box);
      return AppPref(prefBox: openBox);
    } catch (e) {
      rethrow;
    }
  }
}
