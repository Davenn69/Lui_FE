import 'package:hive/hive.dart';
import 'package:lui_fe/core/session/data/models/session_model.dart';

abstract class SessionLocalDataSource{
  Future<void> saveSession(SessionModel session);
  Future<SessionModel?> getSession();
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource{
  final Box<SessionModel> sessionBox;

  SessionLocalDataSourceImpl(this.sessionBox);
  
  @override
  Future<SessionModel?> getSession() async {
    final session = sessionBox.get('session');
    print('🟡🟡 [Hive] Fetched session: ${session?.accessToken ?? "No Session"}');
    return session;
  }
  
  @override
  Future<void> saveSession(SessionModel session) async {
    await sessionBox.put('session', session);
    print('🟡🟡 [Hive] session saved: $session');
  }
}