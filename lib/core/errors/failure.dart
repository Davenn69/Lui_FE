abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  final int? statusCode;
  final Map<String, dynamic>? errorData;
  
  ServerFailure({this.statusCode, required this.errorData, required super.errorMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(errorMessage: "No internet connection");
}