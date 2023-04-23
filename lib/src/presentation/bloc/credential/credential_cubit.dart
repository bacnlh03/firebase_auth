part of 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  CredentialCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
  }) : super(CredentialInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());

    try {
      await signInUseCase.call(
        UserEntity(
          email: email,
          password: password,
        ),
      );

      emit(CredentialSuccess());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    emit(CredentialLoading());

    try {
      await signUpUseCase.call(
        UserEntity(
          email: email,
          username: username,
          password: password,
        ),
      );

      emit(CredentialSuccess());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
