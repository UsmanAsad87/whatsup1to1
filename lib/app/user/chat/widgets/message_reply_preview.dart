import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/enums/message_enum.dart';
import '../../../../common/providers/message_reply_provider.dart';
import 'display_text_image_git.dart';

class MessageReplayPreview extends ConsumerWidget {
  const MessageReplayPreview({required this.recieverName, Key? key}) : super(key: key);
  final String recieverName;

  void cancelReply(WidgetRef ref) {
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReply = ref.watch(messageReplyProvider);
    return Container(
      width: 350,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  messageReply!.isME ? 'Me' : recieverName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
                onTap: () {
                  return cancelReply(ref);
                },
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: messageReply.messageEnum == MessageEnum.text
                ? DisplayTextImageGIF(
                    message: messageReply.message,
                    type: messageReply.messageEnum)
                : SizedBox(
                    height: 200,
                    child: DisplayTextImageGIF(
                        message: messageReply.message,
                        type: messageReply.messageEnum),
                  ),
          ),
        ],
      ),
    );
  }
}
