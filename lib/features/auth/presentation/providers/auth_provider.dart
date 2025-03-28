import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/core/utils/error_mapper.dart';
import 'package:lui_fe/features/auth/business/usecases/register_usecase.dart';
import 'package:lui_fe/features/auth/data/models/responses/login_response.dart';
import 'package:lui_fe/features/auth/data/models/responses/register_response.dart';
import 'package:lui_fe/features/auth/presentation/providers/providers.dart';

class AuthState {
  final bool isLoading;
  final RegisterResponse? registerResponse;
  final LoginResponse? loginResponse;
  final String? error;

  AuthState({ this.isLoading = false, this.registerResponse, this.loginResponse, this.error });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final RegisterUsecase _registerUsecase;

  AuthNotifier(
    this._registerUsecase,
  ) : super(AuthState());

  Future<void> register(RegisterParams params) async {
    state = AuthState(isLoading: true);
    final result = await _registerUsecase.call(params);
    state = result.fold(
      (failure) => AuthState(error: mapFailureToMessage(failure, feature: "Auth")),
      (response) => AuthState(registerResponse: response),
    );
  }
  
  // Future<void> login(RegisterParams params) async {
  //   state = AuthState(isLoading: true);
  //   final result = await _registerUsecase.call(params);
  //   state = result.fold(
  //     (failure) => AuthState(error: mapFailureToMessage(failure)),
  //     (response) => AuthState(registerResponse: response),
  //   );
  // }
  
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final registerUsecase = ref.read(registerUsecaseProvider);

  return AuthNotifier(registerUsecase);
});