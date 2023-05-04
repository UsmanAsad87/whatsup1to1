import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../colors.dart';
import '../../../../common/widgets/loader.dart';
import '../../../user_auth/controllers/auth_controller.dart';
import '../widgets/bottom_chat_field.dart';
import '../widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  final bool isGroupChat;
  const MobileChatScreen({required this.isGroupChat, Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: isGroupChat?Text(name):ref.watch(fetchUserByIdProvider(uid)).when(
            data: (user) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text('offline'),
                  // Text(user.isOnline? 'online':'offline',
                  //   style: const TextStyle(
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.normal
                  //   ),),
                ],
              );
            },
            error: (error, st) {
              print(st);
              print(error);
              return Text(name);
            },
            loading: () => Loader()),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
           Expanded(
            child: ChatList(receiverUserId: uid,isGroupChat:isGroupChat),
          ),
          BottomChatField(
            receiverUserId: uid,
            recieverName: name,
              isGroupChat:isGroupChat,
          ),
        ],
      ),
    );
  }
}
