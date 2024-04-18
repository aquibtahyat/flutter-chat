import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserWidget extends StatelessWidget {
  UserWidget({super.key, required this.ref});

  final WidgetRef ref;

  final List<int> userList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text("User $index"),
        );
      },
    );
  }
}
