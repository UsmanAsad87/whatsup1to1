import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/common/widgets/error.dart';
import 'package:whatsup1to1/common/widgets/loader.dart';
import 'package:whatsup1to1/routes/route_manager.dart';

import '../controller/select_contact_controller.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactsScreen({Key? key}) : super(key: key);

  void selectContact(WidgetRef ref,UserModel selectedContact,BuildContext context){
    Navigator.pushNamed((context), AppRoutes.mobileChatScreen,arguments: {
      'name':selectedContact.name,
      'uid':selectedContact.uid,
    });
    // ref.read(selectContactControllerProvider).selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select contact'),
      ),
      body:ref.watch(getContactProvider).when(
          data:(contactList)=> ListView.builder(
            itemCount: contactList.length,
            itemBuilder:(context,index){
              final contact = contactList[index];
              return InkWell(
                onTap:() => selectContact(ref, contact, context),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      contact.name!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    leading: contact.image == null ? null : CircleAvatar(
                      backgroundImage: NetworkImage(contact.image!),
                      radius: 30,
                    ),
                  ),
                ),
              );
            },
          ),
          error: (err,trace)=>ErrorScreen(error: err.toString()),
          loading: ()=> const Loader()),
    );
  }
}
