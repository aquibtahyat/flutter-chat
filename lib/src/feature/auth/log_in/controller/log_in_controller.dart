import 'package:dartz/dartz.dart';
import 'package:flutter_chat/src/feature/auth/log_in/controller/log_in_state.dart';
import 'package:flutter_chat/src/feature/auth/log_in/service/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logInProvider = StateNotifierProvider<LogInNotifier, LogInState>((ref) {
  return LogInNotifier(ref.watch(logInServiceProvider));
});

class LogInNotifier extends StateNotifier<LogInState> {
  final LogInService _logInService;

  LogInNotifier(this._logInService) : super(LogInInitial());

  Future<Either<String?, void>> logIn({
    required String email,
    required String password,
  }) async {
    state = LogInLoading();
    final response = await _logInService.logIn(
      email: email,
      password: password,
    );

    response.fold(
      (error) => state = LogInError(error!),
      (user) => state = LogInSuccess(),
    );

    return response;
  }
}
