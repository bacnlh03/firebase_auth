import 'package:auth_feature/src/domain/usecases/get_single_user_usecase.dart';
import 'package:auth_feature/src/presentation/bloc/user/get_single_user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:auth_feature/src/data/data_sources/remote/remote_data_source.dart';
import 'package:auth_feature/src/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:auth_feature/src/data/repositories/auth_repository_impl.dart';
import 'package:auth_feature/src/domain/repositories/auth_repository.dart';
import 'package:auth_feature/src/domain/usecases/create_user_usecase.dart';
import 'package:auth_feature/src/domain/usecases/get_current_uid_usecase.dart';
import 'package:auth_feature/src/domain/usecases/is_sign_in_usecase.dart';
import 'package:auth_feature/src/domain/usecases/sign_in_usecase.dart';
import 'package:auth_feature/src/domain/usecases/sign_out_usecase.dart';
import 'package:auth_feature/src/domain/usecases/sign_up_usecase.dart';
import 'package:auth_feature/src/presentation/bloc/auth/auth_state.dart';
import 'package:auth_feature/src/presentation/bloc/credential/credential_state.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentUidUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => CredentialCubit(
      signUpUseCase: sl.call(),
      signInUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => GetSingleUserCubit(getSingleUserUseCase: sl.call()),
  );

  sl.registerLazySingleton(
    () => CreateUserUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => GetCurrentUidUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => GetSingleUserUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => IsSignInUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => SignInUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => SignOutUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton(
    () => SignUpUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl.call()),
  );

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      firebaseFirestore: sl.call(),
      firebaseAuth: sl.call(),
    ),
  );

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  sl.registerLazySingleton(
    () => firebaseAuth,
  );
  sl.registerLazySingleton(
    () => firebaseFirestore,
  );
}
