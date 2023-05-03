import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/core/enums/category_type.dart';

final userAuthNotifierProvider= ChangeNotifierProvider((ref) => UserModelProvider());

class UserModelProvider extends ChangeNotifier {
  UserModel? _userModel;
  File? _profileImage;
  String? _password;
  CategoryType _categoryType=CategoryType.product;

  UserModel get getUserObject => _userModel!;
  File get getProfileImage=>_profileImage!;
  String get getPassword=>_password!;
  CategoryType get getCategoryType=>_categoryType;

  void setUserObject(UserModel obj) {
    _userModel = obj;
    notifyListeners();
  }

  void setPassword(String pass) {
    _password = pass;
    notifyListeners();
  }

  void setProfileImage(File image) {
    _profileImage = image;
    notifyListeners();
  }
  void setCategoryType(CategoryType categoryType) {
    _categoryType = categoryType;
    notifyListeners();
  }
}

