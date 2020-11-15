import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:petwalk/model/usersList.dart';

abstract class UsersRepo {
  Future<Map<String, dynamic>> getUserList();
}

class UserServices implements UsersRepo {
  @override
  Future<Map<String, dynamic>> getUserList() async {
    Response res = await http
        .get('http://run.mocky.io/v3/1970b371-90c7-47c1-bfec-c47ae79b4b43');
    Map<String, dynamic> users = usersFromJson(res.body).toJson();
    return users;
  }
}
