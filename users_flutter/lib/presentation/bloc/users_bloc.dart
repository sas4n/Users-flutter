import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:users_flutter/core/useCase.dart';
import 'package:users_flutter/domain/entity/user_entity.dart';
import 'package:users_flutter/injection.dart';

import '../../domain/repository/repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UseCase _fetchDataUseCase;
  int _pageNr = 0;
  /*UserApiCall _userApiCall = UserApiCall();
  Repository _repo = UserRepositoryImp(_userApiCall);
  var s = FetchDataUseCase(_repo);
  await s.call(0);*/
  UsersBloc(this._fetchDataUseCase) : super(const UsersState()) {
    on<FetchUsersEvent>((event, emit) async {
      if (state.hasReachedMax) {
        print(state.hasReachedMax);
        return;
      }
      try {
        if (state.status == UsersStatus.initial) {
          final useCase = getIt<UseCase>();
          final users = await useCase.call(_pageNr);
          return emit(state.copyWith(
            status: UsersStatus.success,
            users: users,
            hasReachedMax: false,
          ));
        }
        _pageNr++;
        final useCase = getIt<UseCase>();

        final users = await useCase.call(_pageNr);
        emit(users.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: UsersStatus.success,
                users: List.of(state.users)..addAll(users),
                hasReachedMax: false,
              ));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: UsersStatus.failure));
      }
    });
  }
}
