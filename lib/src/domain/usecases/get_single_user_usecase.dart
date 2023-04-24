import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class GetSingleUserUseCase {
  final AuthRepository repository;

  const GetSingleUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(String uid) {
    return repository.getSingleUser(uid);
  }
}