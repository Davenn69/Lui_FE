import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/usecases/get_session_usecase.dart';
import 'package:lui_fe/core/session/business/usecases/save_session_usecase.dart';
import 'package:lui_fe/core/session/data/mappers/session_mapper.dart';
import 'package:lui_fe/core/session/data/models/session_model.dart';
import 'package:lui_fe/core/session/presentation/providers/providers.dart';

class SessionState {
  bool isLoading;

  SessionState({ this.isLoading = false, });
}

class SessionNotifier extends StateNotifier<SessionState> {
  final SaveSessionUsecase _saveSessionUsecase;
  final GetSessionUsecase _getSessionUsecase;

  SessionNotifier(
    this._saveSessionUsecase,
    this._getSessionUsecase
  ) : super(SessionState());

  Future<void> saveSession(SessionModel session) async {
    await _saveSessionUsecase.execute(SessionMapper.toEntity(session));
  }

  Future<SessionEntity?> getSession() async {
    final session = await _getSessionUsecase.execute();
    return session;
  }
}

final SessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  final saveSessionUsecase = ref.read(saveSessionUsecaseProvider);
  final getSessionUsecase = ref.read(getSessionUsecaseProvider);

  return SessionNotifier(saveSessionUsecase, getSessionUsecase);
});