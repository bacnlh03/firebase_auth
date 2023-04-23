part of 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;

  AuthCubit({
    required this.signOutUseCase,
    required this.isSignInUseCase,
    required this.getCurrentUidUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();

        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();

      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();

      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
