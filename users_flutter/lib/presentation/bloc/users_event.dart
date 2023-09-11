part of 'users_bloc.dart';

@immutable
sealed class UsersEvent extends Equatable {}

final class FetchUsersEvent extends UsersEvent {
  @override
  List<Object?> get props => [];
}
