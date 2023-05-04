import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsup1to1/app/user/chat/controller/chat_controller.dart';
import 'package:whatsup1to1/app/user/chat/screens/mobile_chat_screen.dart';
import 'package:whatsup1to1/colors.dart';
import 'package:whatsup1to1/common/widgets/loader.dart';
import 'package:whatsup1to1/models/chat_contact.dart';
import 'package:whatsup1to1/routes/route_manager.dart';

class ContactsList extends ConsumerWidget {
  final bool isWeb;
  const ContactsList({Key? key, required this.isWeb}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<ChatContact>>(
              stream: ref.watch(chatControllerProvider).chatContacts(),
              builder: (context,snapshot) {
                if(snapshot.connectionState== ConnectionState.waiting){
                  return const Loader();
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var chatContactData=snapshot.data![index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                    AppRoutes.mobileChatScreen,
                                    arguments: {
                                      'name':chatContactData.name,
                                      'uid':chatContactData.contactId,
                                      'isGroupChat':false,
                                    }

                                  );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(
                                chatContactData.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  chatContactData.lastMessage,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  chatContactData.profilePic,
                                ),
                                radius: 30,
                              ),
                              trailing: Text(
                                DateFormat.Hm().format(chatContactData.timeSent),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: dividerColor, indent: 85),
                      ],
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
