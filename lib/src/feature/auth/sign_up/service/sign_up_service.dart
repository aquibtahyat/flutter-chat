import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpServiceProvider = Provider<SignUpService>((ref) {
  return SignUpService();
});

class SignUpService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<String?, void>> signup({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Something went wrong');
    }
  }

  Future<Either<String, void>> sendEmailVerification() async {
    try {
      _firebaseAuth.currentUser!.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Something went wrong');
    }
  }
}
