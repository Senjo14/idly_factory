

class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

class TimeoutException extends AppException {
  TimeoutException(String message) : super(message);
}

class ConnectionException extends AppException {
  ConnectionException(String message) : super(message);
}

class ServerException extends AppException {
  ServerException(String message) : super(message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message) : super(message);
}

class NotFoundException extends AppException {
  NotFoundException(String message) : super(message);
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message);
}

class ValidationException extends AppException {
  ValidationException(String message) : super(message);
}

class EmailValidationException extends AppException {
  EmailValidationException(String message) : super(message);
}

class PasswordValidationException extends AppException {
  PasswordValidationException(String message) : super(message);
}

class JsonParsingException extends AppException {
  JsonParsingException(String message) : super(message);
}

class DataNotFoundException extends AppException {
  DataNotFoundException(String message) : super(message);
}

class AuthenticationException extends AppException {
  AuthenticationException(String message) : super(message);
}

class TokenExpiredException extends AppException {
  TokenExpiredException(String message) : super(message);
}

class InvalidCredentialsException extends AppException {
  InvalidCredentialsException(String message) : super(message);
}

class CustomBusinessLogicException extends AppException {
  CustomBusinessLogicException(String message) : super(message);
}

class PaymentProcessingException extends AppException {
  PaymentProcessingException(String message) : super(message);
}

class FileException extends AppException {
  FileException(String message) : super(message);
}

class DatabaseException extends AppException {
  DatabaseException(String message) : super(message);
}
