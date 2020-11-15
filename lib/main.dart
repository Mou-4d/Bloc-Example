import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petwalk/bloc/usersbloc_bloc.dart';
import 'package:petwalk/api/Repository.dart';
import 'package:petwalk/model/usersList.dart';

void main() {
  runApp(MaterialApp(
      home: BlocProvider(
    create: (context) => UsersblocBloc(usersrepo: UserServices()),
    child: Test(),
  )));
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  loadUsers() async {
    context.bloc<UsersblocBloc>().add(UsersblocEvent.fetchUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: BlocBuilder<UsersblocBloc, UsersblocState>(
        builder: (context, state) {
          if (state is UsersListError) {
            final error = state.error;
            return (Text(error.msg));
          }
          if (state is UsersLoading) {}
          if (state is UsersLoaded) {
            Map<String, dynamic> data = state.users;
            return result(data);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Widget result(Map<String, dynamic> data) {
  //print(data);
  return Container(
      width: 400,
      height: 400,
      color: Colors.black,
      child: ListView(
        children: [
          Text(
            '${data["name"]}',
            style: TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      ));
}
