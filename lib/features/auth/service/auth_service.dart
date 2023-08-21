import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants/global_variables.dart';

class AuthService {
// singinuser
  void signinUser(
      {
        required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            "content-Type": "application/json; charset=UTF-8",
          });
      // print(res.statusCode);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account created! Login with same cerdintials");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
