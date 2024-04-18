import 'package:flutter_chat/src/feature/chat_list/model/user_model.dart';

abstract class ChatListState {}

class ChatListInitial extends ChatListState {}

class ChatListLoading extends ChatListState {}

class ChatListSuccess extends ChatListState {
  final UserModel user;

  ChatListSuccess(this.user);
}

class ChatListError extends ChatListState {
  final String message;

  ChatListError(this.message);
}
