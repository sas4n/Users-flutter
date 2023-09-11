part of 'users_bloc.dart';

enum UsersStatus { initial, success, failure }

final class UsersState extends Equatable {
  const UsersState({
    this.status = UsersStatus.initial,
    this.users = const <UserEntity>[],
    this.hasReachedMax = false,
  });

  final UsersStatus status;
  final List<UserEntity> users;
  final bool hasReachedMax;

  UsersState copyWith({
    UsersStatus? status,
    List<UserEntity>? users,
    bool? hasReachedMax,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, users, hasReachedMax];
}
