import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpServiceProvider = Provider<SignUpService>((ref) {
  return SignUpService();
});

class SignUpService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

      await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .set({
        "email": email,
        "status": "Unavalible",
        "uid": _firebaseAuth.currentUser!.uid,
      });

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
