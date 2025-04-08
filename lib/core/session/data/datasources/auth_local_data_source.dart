import 'package:hive/hive.dart';

abstract class AuthLocalDataSource{
  Future<void> saveSession(String accessToken, String refreshToken, Map<dynamic, dynamic> user);
  Future<Map?> getSession();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource{

  final CollectionBox<Map<dynamic, dynamic>>? sessionBox;

  AuthLocalDataSourceImpl({required this.sessionBox});

  @override
  Future<void> saveSession(String accessToken, String refreshToken, Map<dynamic, dynamic> user)async {
    await sessionBox?.put("sessionData", {
      "accessToken" : accessToken,
      "refreshToken" : refreshToken,
      "user" : user,
    });
  }

  @override
  Future<Map?> getSession()async{
    return await sessionBox?.get("sessionData");
  }
}