import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:users_flutter/core/useCase.dart';
import 'package:users_flutter/domain/entity/user_entity.dart';

import '../../Data/dataResourse/users_Api_Call.dart';
import '../../Data/repository/userRepository.dart';
import '../../domain/repository/repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  /*UserApiCall _userApiCall = UserApiCall();
  Repository _repo = UserRepositoryImp(_userApiCall);
  var s = FetchDataUseCase(_repo);
  await s.call(0);*/
  UsersBloc(this._fetchDataUseCase) : super(const UsersState()) {
    on<UsersEvent>((event, emit) async {
      if (state.hasReachedMax) return;
      try {
        if (state.status == UsersStatus.initial) {
          final users = await _fetchDataUseCase();
          return emit(state.copyWith(
            status: UsersStatus.success,
            users: users,
            hasReachedMax: false,
          ));
        }
        final users = await _fetchDataUseCase(state.users.length);
        emit(users.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: UsersStatus.success,
                users: List.of(state.users)..addAll(users),
                hasReachedMax: false,
              ));
      } catch (_) {
        emit(state.copyWith(status: UsersStatus.failure));
      }
    });
  }
  final UseCase _fetchDataUseCase;
}
