import 'package:auth_feature/src/data/data_sources/remote/remote_data_source.dart';
import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createUser(UserEntity user) async {
    return remoteDataSource.createUser(user);
  }

  @override
  Future<String> getCurrentUid() async {
    return remoteDataSource.getCurrentUid();
  }

  @override
  Future<bool> isSignIn() async {
    return remoteDataSource.isSignIn();
  }

  @override
  Future<void> signIn(UserEntity user) async {
    return remoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    return remoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    return remoteDataSource.signUp(user);
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    // TODO: implement getSingleUser
    throw UnimplementedError();
  }
}
