import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/app/user_auth/controllers/user_auth_notifier_provider.dart';
import 'package:whatsup1to1/app/user_auth/data/apis/auth_apis.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';
import 'package:whatsup1to1/common/widgets/upload_image_to_firebase.dart';
import '../../../common/common_apis_libs/common_api_libs.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authApis: ref.watch(authApisProvider),
  );
});

final userStateStreamProvider = StreamProvider((ref) {
  final authProvider = ref.watch(authControllerProvider.notifier);
  return authProvider.getSigninStatusOfUser();
});


final currentUserAuthProvider = FutureProvider((ref) {
  final authCtr = ref.watch(authControllerProvider.notifier);
  return authCtr.currentUser();
});

final currentAuthUserInfoProvider = FutureProvider.family((ref, String uid) {
  final profileController = ref.watch(authControllerProvider.notifier);
  return profileController.getCurrentUserInfo(uid: uid);
});

final fetchUserByIdProvider = StreamProvider.family((ref, String uid) {
  final profileController = ref.watch(authControllerProvider.notifier);
  return profileController.userDataById(uid);
});
final userDataAuthProvider = FutureProvider((ref){
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData();
});

class AuthController extends StateNotifier<bool> {
  final AuthApis _authApis;
  AuthController({
    required AuthApis authApis,
  })  : _authApis = authApis,
        super(false);

  Future<User?> currentUser() async {
    return _authApis.getCurrentUser();
  }

  // Register Customer
  Future<void> registerCustomerWithEmailAndPassword({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final userProvider = ref.watch(userAuthNotifierProvider);
    final result = await _authApis.registerWithEmailPassword(
        email: userProvider.getUserObject.email!,
        password: userProvider.getPassword);
    final String? imgUrl = await uploadImage(
        img: userProvider.getProfileImage,
        storageFolderName: FirebaseConstants.userAuthStorage);

    result.fold((l) {
      state = false;
      showSnakBar(context, l.message);
    }, (r) async {
      UserModel userModel = userProvider.getUserObject;
      userModel = userModel.copyWith(
        uid: r.uid,
        image: imgUrl,
        approved: true,
        createdAt: DateTime.now(),
        activated: true,
        sellerSubModel: null,
      );
      final result2 = await _authApis.saveUserInfo(userModel: userModel);
      result2.fold((l) {
        state = false;
        showToast(msg: l.message);
      }, (r) {
        state = false;
        showToast(msg: 'Account Created Successfully');
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.userMainMenu, (route) => false);
      });
    });
  }

//Register Seller
  Future<void> registerSellerWithEmailAndPassword({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final userProvider = ref.watch(userAuthNotifierProvider);
    final result = await _authApis.registerWithEmailPassword(
        email: userProvider.getUserObject.email!,
        password: userProvider.getPassword);
    final String? imgUrl = await uploadImage(
        img: userProvider.getProfileImage,
        storageFolderName: FirebaseConstants.sellerAuthStorage);

    result.fold((l) {
      state = false;
      showSnakBar(context, l.message);
    }, (r) async {
      UserModel userModel = userProvider.getUserObject;
      userModel = userModel.copyWith(
        uid: r.uid,
        image: imgUrl,
        approved: true,
        activated: true,
        createdAt: DateTime.now(),
      );
      final result2 = await _authApis.saveUserInfo(userModel: userModel);
      result2.fold((l) {
        state = false;
        showToast(msg: l.message);
      }, (r) {
        state = false;
        // showToast(msg:'Account Created Successfully');
        Navigator.pushNamedAndRemoveUntil(context,
            AppRoutes.sellerAccountUnderReviewScreen, (route) => false);
      });
    });
  }

  // Login User
  Future<void> signInUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final result = await _authApis.signInWithEmailAndPass(
        email: email, password: password);

    result.fold((l) {
      showSnakBar(context, l.message);
    }, (r) async {
      final userId = await _authApis.getCurrentUser();
      userId!.uid;
      final result = await _authApis.getCurrentUserInfo(uid: userId!.uid);
      UserModel userModel =
          UserModel.fromJson(result.data() as Map<String, dynamic>);
      if (!userModel.activated!) {
        showToast(msg: "Your account is deactivated by Admin!");
      } else {
        if (userModel.accountType == "Seller") {
          if (userModel.approved!) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.sellerMainMenu, (route) => false);
          } else {
            Navigator.pushNamed(
                context, AppRoutes.sellerAccountUnderReviewScreen);
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.userMainMenu, (route) => false);
        }
      }
    });
    state = false;
  }

  Future<UserModel> getCurrentUserInfo({required String uid}) async {
    final result = await _authApis.getCurrentUserInfo(uid: uid);
    UserModel userModel =
        UserModel.fromJson(result.data() as Map<String, dynamic>);
    return userModel;
  }

  Future<UserModel> getUserData() async {

    final result = await _authApis.getUserData();
    UserModel userModel =
    UserModel.fromJson(result.data() as Map<String, dynamic>);
    return userModel;
  }

  void setUserState(bool isOnline){
    _authApis.setUserState(isOnline);
  }

  Future<void> changeUserPassword({
    required String currentPass,
    required String newPass,
    required BuildContext context,
  }) async {
    state = true;
    final result = await _authApis.changePassword(
        currentPassword: currentPass, newPassword: newPass);
    state = false;
    result.fold((l) {
      showSnakBar(context, l.message);
    }, (r) {});
  }

  // Forgot Password
  Future<void> forgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    state = true;
    final result = await _authApis.forgotPassword(email: email);
    state = false;
    result.fold((l) {
      showSnakBar(context, l.message);
    }, (r) {
      showSnakBar(context, "Reset Password Email Sent!");
    });
  }

  // LogOut User
  Future<void> logout({
    required BuildContext context,
  }) async {
    state = true;
    final result = await _authApis.logout();
    state = false;
    result.fold((l) {
      showSnakBar(context, l.message);
    }, (r) {
      showSnakBar(context, 'Logout Successful');
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.userLoginScreen, (route) => false);
    });
  }

  // getSigninStatusOfUser
  Stream<User?> getSigninStatusOfUser() {
    return _authApis.getSignInStatusOfUser();
  }
  Stream<UserModel> userDataById(String userId){
    return _authApis.userData(userId);
  }


  // Update User Information
  // Future<void> updateCurrentUserInfo({
  //   required BuildContext context,
  //   required String name,
  //   required String email,
  //   required String uid,
  // }) async {
  //   final result =
  //       await _authApis.updateCurrentUserInfo(name: name, email: email);
  //
  //   result.fold((l) {
  //     showSnakBar(context, l.message);
  //   }, (r) async {
  //     final result2 =
  //         await _authApis.updateFirestoreCurrentUserInfo(userModel: {
  //       'email': email,
  //       'displayName': name,
  //     }, uid: uid);
  //     result2.fold((l) {
  //       showSnakBar(context, l.message);
  //     }, (r) {
  //       showSnakBar(context, 'Profile Updated Successfully');
  //       // Navigator.pushNamedAndRemoveUntil(context, AppRoutes.userMainMenuScreen, (route) => false);
  //     });
  //   });
  // }

  Future<String> uploadFileAttachment({
    required File file,
    required String fileName,
    required BuildContext context,
  }) async {
    state = true;
    String fileUrl = "";
    final result =
        await _authApis.uploadFileAttachment(file: file, fileName: fileName);
    state = false;
    result.fold((l) {
      showSnakBar(context, l.message);
    }, (r) {
      fileUrl = r;
    });
    return fileUrl;
  }
}
