import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logInServiceProvider = Provider<LogInService>((ref) {
  return LogInService();
});

class LogInService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<String?, User?>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_firebaseAuth.currentUser!.emailVerified) {
        return left('Please verify your email');
      }
      return right(response.user!);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Something went wrong');
    }
  }
}
