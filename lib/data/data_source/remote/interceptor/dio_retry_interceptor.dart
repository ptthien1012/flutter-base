import 'package:dio_smart_retry/dio_smart_retry.dart';

class DioRetryInterceptor extends RetryInterceptor {
  DioRetryInterceptor(
      {required super.dio,
      super.retries = 2,
      super.retryDelays = const [Duration(seconds: 1), Duration(seconds: 1)]});
}
