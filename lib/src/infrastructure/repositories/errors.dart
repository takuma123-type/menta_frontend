class NotFoundError extends Error {
  @override
  String toString() => 'NotFoundError: Resource not found';
}

class UnauthorizedError extends Error {
  @override
  String toString() => 'UnauthorizedError: Unauthorized access';
}

class UnknownError extends Error {
  @override
  String toString() => 'UnknownError: An unknown error occurred';
}

class BadRequestError extends Error {
  @override
  String toString() => 'BadRequestError: Bad request';
}

class InvalidSessionTokenError extends Error {
  @override
  String toString() => 'InvalidSessionTokenError: Invalid session token';
}

class InvalidParameterError extends Error {
  @override
  String toString() => 'InvalidParameterError: Invalid parameter';
}

class FailSignUpError extends Error {
  @override
  String toString() => 'FailSignUpError: Failed to sign up';
}

class FailLogOutError extends Error {
  @override
  String toString() => 'FailLogOutError: Failed to log out';
}

class ApiError extends Error {
  final String message;
  final int statusCode;

  ApiError(this.message, this.statusCode);

  @override
  String toString() => 'ApiError: $message, status code: $statusCode';
}

class NetworkError extends Error {
  final String message;

  NetworkError(this.message);

  @override
  String toString() => 'NetworkError: $message';
}

class ParsingError extends Error {
  final String message;

  ParsingError(this.message);

  @override
  String toString() => 'ParsingError: $message';
}