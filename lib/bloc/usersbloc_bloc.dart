import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:petwalk/api/Repository.dart';
import 'package:petwalk/api/exceptions.dart';
import 'package:petwalk/model/usersList.dart';

part 'usersbloc_event.dart';
part 'usersbloc_state.dart';

class UsersblocBloc extends Bloc<UsersblocEvent, UsersblocState> {
  final UsersRepo usersrepo;
  Map<String, dynamic> users;
  UsersblocBloc({this.usersrepo}) : super(UsersblocInitial());

  @override
  Stream<UsersblocState> mapEventToState(UsersblocEvent event) async* {
    switch (event) {
      case UsersblocEvent.fetchUsers:
        yield UsersLoading();
        try {
          users = await usersrepo.getUserList();
          yield UsersLoaded(users: users);
        } on SocketException {
          yield UsersListError(error: NoInternet('No Internet !'));
        } on HttpException {
          yield UsersListError(error: InvalidFormat('No Service Found !'));
        } on FormatException {
          yield UsersListError(
              error: InvalidFormat('Invalid Response Format !'));
        } catch (e) {
          yield UsersListError(error: Unknown('Unknown Error !'));
        }
        break;
    }
  }
}
