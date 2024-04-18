import 'package:dartz/dartz.dart';
import 'package:flutter_chat/src/feature/auth/sign_up/controller/sign_up_state.dart';
import 'package:flutter_chat/src/feature/auth/sign_up/service/sign_up_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {
  return SignUpNotifier(ref.watch(signUpServiceProvider));
});

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpService _signUpService;

  SignUpNotifier(this._signUpService) : super(SignUpInitial());

  Future<Either<String?, void>> signup({
    required String email,
    required String password,
  }) async {
    state = SignUpLoading();
    final response = await _signUpService.signup(
      email: email,
      password: password,
    );

    response.fold(
      (error) => state = SignUpError(error!),
      (user) => state = SignUpSuccess(),
    );

    return response;
  }
}
