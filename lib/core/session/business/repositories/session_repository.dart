abstract class SessionRepository{
  Future<void> saveSession(String accessToken, String refreshToken);
}