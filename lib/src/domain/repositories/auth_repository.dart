import 'package:auth_feature/src/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> createUser(UserEntity user);
  Future<String> getCurrentUid();
}
