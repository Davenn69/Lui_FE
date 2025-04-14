import 'package:dio/dio.dart';

class BadRequestException extends DioException {
  final String? errorMessage;

  BadRequestException({this.errorMessage, required super.requestOptions});

  @override
  String toString() => errorMessage ?? 'Invalid Request';
}

class UnauthorizedException extends DioException {
  UnauthorizedException({required super.requestOptions});

  @override
  String toString() => 'Access Denied';
}

class NotFoundException extends DioException {
  NotFoundException({required super.requestOptions});

  @override
  String toString() => 'The requested information could not be found';
}

class InternalServerErrorException extends DioException {
  final String? errorMessage;

  InternalServerErrorException({
    this.errorMessage,
    required super.requestOptions,
  });

  @override
  String toString() =>
      errorMessage ?? 'Unknown error occurred, please try again later.';

  // forceLogout() {
  // FlavorConfig.instance?.values.token = '';
  // Hive.box<UserModel>(HiveBoxes.user).delete(HiveBoxes.user);
  // Hive.box<String>(HiveBoxes.token).delete(HiveBoxes.token);

  //  TODO: log out router
  // }
}
