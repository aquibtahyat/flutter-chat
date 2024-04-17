import 'package:flutter_chat/app.dart';
import 'package:flutter_chat/src/core/route/chat_app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      name: ChatAppRoutes.root,
      builder: (context, state) =>
          const MyHomePage(title: 'Demo Counter Home Page'),
    )
  ]);
});
