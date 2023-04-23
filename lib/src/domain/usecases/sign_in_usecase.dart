import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  const SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signIn(user);
  }
}