import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class CreateUserUseCase {
  final AuthRepository repository;

  const CreateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.createUser(user);
  }
}