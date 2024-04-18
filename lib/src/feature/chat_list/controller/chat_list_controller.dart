import 'package:dartz/dartz.dart';
import 'package:flutter_chat/src/feature/chat_list/controller/chat_list_state.dart';
import 'package:flutter_chat/src/feature/chat_list/model/user_model.dart';
import 'package:flutter_chat/src/feature/chat_list/service/chat_list_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatListProvider =
    StateNotifierProvider<ChatListNotifier, ChatListState>((ref) {
  return ChatListNotifier(ref.watch(chatListServiceProvider));
});

class ChatListNotifier extends StateNotifier<ChatListState> {
  final ChatListService _chatListService;

  ChatListNotifier(this._chatListService) : super(ChatListInitial());

  Future<Either<String?, UserModel?>> searchUser({
    required String email,
  }) async {
    state = ChatListLoading();
    final response = await _chatListService.searchUser(
      email: email,
    );

    response.fold(
      (error) => state = ChatListError(error!),
      (user) => state = ChatListSuccess(user!),
    );

    return response;
  }
}
