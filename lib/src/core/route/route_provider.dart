import 'package:flutter_chat/src/core/route/chat_app_routes.dart';
import 'package:flutter_chat/src/feature/auth/log_in/view/screen/log_in_screen.dart';
import 'package:flutter_chat/src/feature/auth/sign_up/view/screen/sign_up_screen.dart';
import 'package:flutter_chat/src/feature/chat_list/view/chat_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      name: ChatAppRoutes.root,
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      path: '/logInScreen',
      name: ChatAppRoutes.logInScreen,
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      path: '/signUpScreen',
      name: ChatAppRoutes.signUpScreen,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/chatListScreen',
      name: ChatAppRoutes.chatListScreen,
      builder: (context, state) => const ChatListScreen(),
    ),
  ]);
});
