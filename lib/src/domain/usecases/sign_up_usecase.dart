import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  const SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signUp(user);
  }
}
