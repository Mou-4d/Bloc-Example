part of 'usersbloc_bloc.dart';

abstract class UsersblocState extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersblocInitial extends UsersblocState {}

class UsersLoading extends UsersblocState {}

class UsersLoaded extends UsersblocState {
  final Map<String, dynamic> users;
  UsersLoaded({this.users});
}

class UsersListError extends UsersblocState {
  final error;
  UsersListError({this.error});
}
