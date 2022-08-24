class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Unable to process the request');
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad request ');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'Unauthorized  request ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input ');
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message])
      : super(message, 'Api not responding ');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Page not found');
}
