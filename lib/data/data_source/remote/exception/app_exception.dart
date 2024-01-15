class AppException implements Exception {
  AppException([this._messages, this._prefix]);
  final String? _messages;
  final String? _prefix;

  @override
  String toString() {
    return '$_prefix$_messages';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'UnAuthorized Request: ');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Not Found Request: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input Request: ');
}

class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, 'Conflict Request: ');
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, 'Internal Server: ');
}
