import 'dart:convert';

import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/features/home/screens/home_scree.dart';
import 'package:amazon/models/user.dart';
import 'package:amazon/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_variables.dart';

class AuthService {
// singinuser
  void signupUser(
      {required BuildContext context,
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

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            "content-Type": "application/json; charset=UTF-8",
          });
      // print(res.statusCode);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x_auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
