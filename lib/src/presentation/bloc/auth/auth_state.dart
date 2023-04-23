import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth_feature/src/domain/usecases/get_current_uid_usecase.dart';
import 'package:auth_feature/src/domain/usecases/is_sign_in_usecase.dart';
import 'package:auth_feature/src/domain/usecases/sign_out_usecase.dart';

part 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final String uid;

  const Authenticated({required this.uid});

  @override
  List<Object?> get props => [uid];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
