import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/usecases/sign_in_usecase.dart';
import 'package:auth_feature/src/domain/usecases/sign_up_usecase.dart';

part 'credential_cubit.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();
}

class CredentialInitial extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialLoading extends CredentialState {
  @override
  List<Object> get props => [];
}

class CredentialSuccess extends CredentialState {
  @override
  List<Object> get props => [];
}

class CredentialFailure extends CredentialState {
  @override
  List<Object> get props => [];
}
