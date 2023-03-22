import 'package:flutter_base/data/remote/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(Status? status, T? data, String? message);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.complete() : status = Status.complete;

  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return 'Status: $status\nMessage: $message\nStatus: $status\n';
  }
}
