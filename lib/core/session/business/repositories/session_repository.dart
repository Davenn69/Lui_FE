abstract class SessionRepository{
  Future<void> saveSession(String accessToken, String refreshToken, Map<dynamic, dynamic> user);
  Future<Map?> getSession();
}