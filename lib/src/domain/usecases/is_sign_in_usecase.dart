import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class IsSignInUseCase {
  final AuthRepository repository;

  const IsSignInUseCase({required this.repository});

  Future<bool> call() {
    return repository.isSignIn();
  }
}