import 'package:logger/logger.dart';

Logger get logger => Log.instance;

class Log extends Logger {
  Log._()
      : super(
          printer: PrettyPrinter(
              printTime: true, methodCount: 0, noBoxingByDefault: true),
          output: null,
          filter: null,
        );
  static final instance = Log._();
}
