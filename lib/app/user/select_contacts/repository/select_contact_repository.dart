import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/common/common_apis_libs/common_api_libs.dart';
import 'package:whatsup1to1/common/utils/utils.dart';
import 'package:whatsup1to1/routes/route_manager.dart';

import '../../../user_auth/data/models/user_model.dart';
import '../../chat/screens/mobile_chat_screen.dart';

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}

final selectContactRepositoryProvider = Provider((ref) => SelectContactRepository(firestore: FirebaseFirestore.instance),);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({required this.firestore});

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return contacts;
  }

  void selectContact(Contact selectedContact,BuildContext context) async{
    try{
      var userCollection = await firestore.collection(FirebaseConstants.userCollection).get();
      bool isFound =false;
      for( var document in userCollection.docs){
        var userData = UserModel.fromJson(document.data());
        String selectedPhoneNum = selectedContact.phones[0].number.replaceAll(' ', '');
        if(selectedPhoneNum[3] =='0') {
          selectedPhoneNum=replaceCharAt(selectedPhoneNum,3, '');
        }
        print("From firebase: "+ userData.phone!);
        print("Selected: "+selectedPhoneNum);
        if(selectedPhoneNum== userData.phone) {
          isFound = true;
          print(userData.toJson());
          Navigator.pushNamed((context), AppRoutes.mobileChatScreen,arguments: {
            'name':userData.name,
            'uid':userData.uid,
          });
        }
      }
      if(!isFound){
        showSnackBar(context: context, content: 'This number does not exist in this app.');
      }
    }catch(e){
      showSnackBar(context: context, content: e.toString());

    }
  }
}
