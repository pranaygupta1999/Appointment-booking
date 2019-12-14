import 'package:http/http.dart' as Http;

import './data.dart' as data;
import 'dart:convert';

class User {
  final int uid;
  final String uname;
  final String password;
  User(this.uid, this.uname, this.password);

  static User fromJson(Map<String, dynamic> json) {
    return User(json['uid'], json['uname'], json['password'],
        );
  }

  static Future<User> login(String uname, String password) async {
    try {
      var res = await Http.post(data.URL + '/login',
          body: {'uname': uname, 'password': password});
      Map<String, dynamic> resJson = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var userObj = User.fromJson(resJson);
        return userObj;
      } else {
        throw Exception(resJson);
      }
    } catch (e) {
      throw e;
    }
  }
}

  

