import 'package:auth_feature/src/domain/repositories/auth_repository.dart';

class GetCurrentUidUseCase {
  final AuthRepository repository;

  const GetCurrentUidUseCase({required this.repository});

  Future<void> call() {
    return repository.getCurrentUid();
  }
}