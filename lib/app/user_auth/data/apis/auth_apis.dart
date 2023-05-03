import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../../common/common_apis_libs/common_api_libs.dart';
import '../models/user_model.dart';

final authApisProvider = Provider<AuthApis>((ref) {
  final fireStore = ref.watch(firebaseDatabaseProvider);
  final auth = ref.watch(firebaseAuthProvider);
  final storage = ref.watch(firebaseStorageProvider);
  return AuthApis(auth: auth,firestore:fireStore,storage:storage );
});

abstract class IAuthApis {
  FutureEither<User> signInWithEmailAndPass(
      {required String email, required String password});
  FutureEither<User> registerWithEmailPassword(
      {required String email, required String password});
  FutureEitherVoid forgotPassword({required String email});
  FutureEitherVoid logout();
  Future<User?> getCurrentUser();
  Stream<User?> getSignInStatusOfUser();
  FutureEitherVoid updateCurrentUserInfo({
    required String name,
    required String email,
  });
  FutureEitherVoid changePassword(
      {required String currentPassword, required String newPassword});

  FutureEitherVoid saveUserInfo({required UserModel userModel});
  FutureEitherVoid updateFirestoreCurrentUserInfo(
      {required Map<String, dynamic> userModel, required String uid});
  Future<DocumentSnapshot> getCurrentUserInfo({required String uid});
}

class AuthApis implements IAuthApis {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  AuthApis({required FirebaseAuth auth,required FirebaseFirestore firestore,required FirebaseStorage storage}) : _auth = auth,_firestore = firestore,_storage=storage;

  @override
  FutureEitherVoid logout() async {
    try {
      final response = await _auth.signOut();
      return Right(response);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<User> registerWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(response.user!);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<User> signInWithEmailAndPass(
      {required String email, required String password}) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(response.user!);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  @override
  FutureEitherVoid forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEitherVoid updateCurrentUserInfo({
    required String name,
    required String email,
  }) async {
    try {
      await _auth.currentUser!.updateDisplayName(name);
      await _auth.currentUser!.updateEmail(email);
      return const Right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEitherVoid changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      var user = _auth.currentUser!;
      var credentials = EmailAuthProvider.credential(
          email: _auth.currentUser!.email!, password: currentPassword);
      await user.reauthenticateWithCredential(credentials);
      await _auth.currentUser!.updatePassword(newPassword);
      return const Right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<User?> getSignInStatusOfUser() {
    return _auth.authStateChanges();
  }

  @override
  FutureEitherVoid saveUserInfo({required UserModel userModel}) async {
    try {
      await _firestore
          .collection(FirebaseConstants.userCollection)
          .doc(userModel.uid)
          .set(userModel.toJson());
      return const Right(null);
    } on FirebaseException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEitherVoid updateFirestoreCurrentUserInfo(
      {required Map<String, dynamic> userModel, required String uid}) async {
    try {
      await _firestore
          .collection(FirebaseConstants.userCollection)
          .doc(uid)
          .update(userModel);
      return const Right(null);
    } on FirebaseException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<DocumentSnapshot> getCurrentUserInfo({required String uid}) async {
    final DocumentSnapshot document = await _firestore
        .collection(FirebaseConstants.userCollection)
        .doc(uid)
        .get();
    return document;
  }



  FutureEither<String> uploadFileAttachment({required File file, required String fileName}) async {
    try {
      String random=const Uuid().v1();
      final path = 'profileDocs/${fileName+random.substring(0,6)}';
      final ref = _storage.ref().child(path);
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot snap = await uploadTask.whenComplete(() {});
      String downloadUrl = await snap.ref.getDownloadURL();
      return Right(downloadUrl);
    } on FirebaseAuthException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Firebase Storage Error Occurred', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }
}
