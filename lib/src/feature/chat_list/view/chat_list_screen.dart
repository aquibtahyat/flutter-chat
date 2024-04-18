import 'package:flutter/material.dart';
import 'package:flutter_chat/src/core/route/chat_app_routes.dart';
import 'package:flutter_chat/src/feature/auth/log_in/controller/log_in_controller.dart';
import 'package:flutter_chat/src/feature/chat_list/view/widget/user_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat List"),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 80,
              collapsedHeight: 80,
              flexibleSpace: ElevatedButton(
                onPressed: () {
                  ref.read(logInProvider.notifier).logOut();
                  context.go(ChatAppRoutes.logInScreen);
                },
                child: const Text("Sign out"),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              pinned: true,
              elevation: 0,
            ),
            SliverFillRemaining(
              child: UserWidget(
                ref: ref,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
