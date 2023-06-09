import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth_feature/src/domain/entities/user_entity.dart';
import 'package:auth_feature/src/domain/usecases/get_single_user_usecase.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;

  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());

    try {
      final streamResponse = getSingleUserUseCase.call(uid);

      streamResponse.listen((users) {
        emit(GetSingleUserLoaded(user: users.first));
      });
    } catch (_) {
      emit(GetSingleUserFailure());
    }
  }
}
