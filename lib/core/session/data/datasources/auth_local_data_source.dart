import 'package:hive/hive.dart';

abstract class AuthLocalDataSource{
  Future<void> saveSession(String accessToken, String refreshToken);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource{

  final CollectionBox<Map<dynamic, dynamic>>? sessionBox;

  AuthLocalDataSourceImpl({required this.sessionBox});

  @override
  Future<void> saveSession(String accessToken, String refreshToken)async {
    await sessionBox?.put("sessionData", {
      "accessToken" : accessToken,
      "refreshToken" : refreshToken
    });
  }

}