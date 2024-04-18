import 'package:flutter/material.dart';
import 'package:flutter_chat/src/feature/chat_list/controller/chat_list_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUserWidget extends StatefulWidget {
  const SearchUserWidget({super.key, required this.ref});

  final WidgetRef ref;

  @override
  State<SearchUserWidget> createState() => _SearchUserWidgetState();
}

final TextEditingController _controller = TextEditingController();

class _SearchUserWidgetState extends State<SearchUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {},
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: () {
              widget.ref.read(chatListProvider.notifier).searchUser(
                    email: _controller.text,
                  );
            },
            child: const Icon(Icons.search),
          ),
          border: InputBorder.none,
          hintText: "Search user with email",
        ),
      ),
    );
  }
}
