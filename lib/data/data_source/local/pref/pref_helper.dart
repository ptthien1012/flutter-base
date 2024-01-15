abstract class PrefHelper {
  Future<bool> firstRun();

  Future<String?>? getToken();

  Future<void> setToken(String token);

  Future<void> setFirstRun({required bool isFirstRun});
}
