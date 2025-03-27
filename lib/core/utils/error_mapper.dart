import 'package:lui_fe/core/errors/failure.dart';

String mapFailureToMessage(Failure failure, {String? feature}) {
  if (failure is ServerFailure) {
    return _mapServerError(failure.statusCode!, failure.errorMessage, feature);
  } else if (failure is NetworkFailure) {
    return "No internet connection. Please try again later";
  } 
  return "Unexpected error occured!";
}

String _mapServerError(int statusCode, String errorMessage, String? feature) {
  switch (statusCode) {
    case 400: 
      return "Bad request. Please check credentials";
    case 401:
      return "Unauthorized. Please log in again";
    case 403:
      return "Forbidden. You don't have permission";
    case 404:
      return "Resource not found";
      case 409:
      return _mapConflictError(feature) ?? "Conflict detected. Please try again later.";
    case 410:
      return "This resource is no longer available.";
    case 500:
      return "Server error. Please try again later.";
    default:
      return errorMessage;
  }
}

String? _mapConflictError(String? feature) {
  switch (feature) {
    case "Auth":
      return "Email already registered. Try another email";
    case "Transaction":
      return "Transaction already exists. Please check your history";
    default:
      return null;
  }
}