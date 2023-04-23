import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  const SignOutUseCase({required this.repository});

  Future<void> call() {
    return repository.signOut();
  }
}
