import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat/src/feature/chat_list/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final chatListServiceProvider = Provider<ChatListService>((ref) {
  return ChatListService();
});

class ChatListService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? userMap;

  Future<Either<String?, UserModel?>> searchUser({String? email}) async {
    try {
      await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) {
        userMap = value.docs.first.data();
      });

      final userModel = UserModel.fromJson(userMap!);
      return right(userModel);
    } catch (e) {
      return left(e.toString());
    }
  }
}
