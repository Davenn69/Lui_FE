import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/business/usecases/save_session_usecase.dart';
import 'package:lui_fe/core/session/presentation/providers/providers.dart';
import 'package:lui_fe/core/utils/error_mapper.dart';
import 'package:lui_fe/features/auth/business/usecases/register_usecase.dart';
import 'package:lui_fe/features/auth/data/models/responses/login_response.dart';
import 'package:lui_fe/features/auth/data/models/responses/register_response.dart';
import 'package:lui_fe/features/auth/presentation/providers/providers.dart';

import '../../business/usecases/login_usecase.dart';

class AuthState {
  final bool isLoading;
  final RegisterResponse? registerResponse;
  final LoginResponse? loginResponse;
  final String? error;

  AuthState({ this.isLoading = false, this.registerResponse, this.loginResponse, this.error });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;
  final SaveSessionUsecase _saveSessionUsecase;

  AuthNotifier(
    this._registerUsecase,
    this._loginUsecase,
    this._saveSessionUsecase
  ) : super(AuthState());

  Future<void> register(RegisterParams params) async {
    state = AuthState(isLoading: true);
    final result = await _registerUsecase.call(params);
    state = result.fold(
      (failure) => AuthState(isLoading: false, error: mapFailureToMessage(failure, feature: "Auth")),
      (response) => AuthState(isLoading: false, registerResponse: response),
    );
  }
  
  Future<void> login(LoginParams params) async {
    state = AuthState(isLoading: true);
    final result = await _loginUsecase.call(params);
    state = await result.fold(
      (failure) async => AuthState(isLoading: false, error: mapFailureToMessage(failure, feature: "Auth")),
      (response) async {
        // Save Session
        if (response.data != null) {  
        final accessToken = response.data?['accessToken'];
        final refreshToken = response.data?['refreshToken'];
        final accessTokenExpires = response.data?['accessTokenExpires'];
        final refreshTokenExpires = response.data?['refreshTokenExpires'];

        if (accessToken != null && refreshToken != null && 
            accessTokenExpires != null && refreshTokenExpires != null) { 
            final SessionEntity session = SessionEntity(
              accessToken: accessToken,
              refreshToken: refreshToken,
              accessTokenExpires: accessTokenExpires,
              refreshTokenExpires: refreshTokenExpires,
            );
            await _saveSessionUsecase.execute(session);
          } else {
            return AuthState(error: "Invalid session data");
          }
        } else {
          return AuthState(error: "Response data is null");
        }
        return AuthState(isLoading: false, loginResponse: response);
      },
    );
  }
  
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final registerUsecase = ref.read(registerUsecaseProvider);
  final loginUsecase = ref.read(loginUsecaseProvider);
  final saveSessionUsecase = ref.read(saveSessionUsecaseProvider);

  return AuthNotifier(registerUsecase, loginUsecase, saveSessionUsecase);
});