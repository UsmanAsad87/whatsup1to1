import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/message_enum.dart';

class MessageReply{
  final String message;
  final bool isME;
  final MessageEnum messageEnum;

  MessageReply(this.message, this.isME, this.messageEnum);
}

final messageReplyProvider = StateProvider<MessageReply?>((ref)=>null);