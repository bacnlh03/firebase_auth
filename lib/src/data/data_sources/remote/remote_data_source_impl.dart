// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auth_feature/src/data/data_sources/remote/remote_data_source.dart';
import 'package:auth_feature/src/data/models/user_model.dart';
import 'package:auth_feature/src/domain/entities/user_entity.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  RemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection('users');
    final uid = await getCurrentUid();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        uid: uid,
        email: user.email,
        username: user.username,
        password: user.password,
      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Future<bool> isSignIn() async {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        );
      } else {
        print('Fields cannot be empty');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User not found');
      } else if (e.code == 'wrong-password') {
        print('Invalid email or password');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      )
          .then(
        (currentUser) async {
          if (currentUser.user?.uid != null) {
            createUser(user);
          }
        },
      );
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        print("Email is already taken");
      } else {
        print("Something went wrong");
      }
    }
  }

  @override
  Future<String> getCurrentUid() async {
    return firebaseAuth.currentUser!.uid;
  }
}
