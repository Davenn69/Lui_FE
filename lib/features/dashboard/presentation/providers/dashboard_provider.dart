import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/utils/error_mapper.dart';
import 'package:lui_fe/features/dashboard/business/entities/user.dart';
import 'package:lui_fe/features/dashboard/business/usecases/get_user_usecase.dart';
import 'package:lui_fe/features/dashboard/data/models/get_user_response.dart';
import 'package:lui_fe/features/dashboard/presentation/providers/providers.dart';

final selectedPageIndexProvider = StateProvider<int>((ref)=>0);

class UserState {
  final bool isLoading;
  final User? user;
  final String? error;
  final GetUserResponse? getUserResponse;

  UserState({this.user, this.getUserResponse, this.isLoading=false, this.error});
}

class UserNotifier extends StateNotifier<UserState> {
  final GetUserUsecase _getUserUseCase;

  UserNotifier(
    this._getUserUseCase
  ) : super(UserState());
  
  Future<void> getUser(String userId) async {
    state = UserState(isLoading: true);
    final result = await _getUserUseCase.call(userId);
    state = result.fold(
      (failure) => UserState(error: mapFailureToMessage(failure, feature: "User")),
      (response) => UserState(getUserResponse: response)
    );
  }
}

final dashboardProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final getUserUsecase = ref.read(getUserUsecaseProvider);

  return UserNotifier(getUserUsecase);
});