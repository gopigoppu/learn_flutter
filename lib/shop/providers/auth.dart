import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late final String _token;
  late final DateTime _expiryDate;
  late final String _userId;
  final String firebaseSignupUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyArZkfV9Jlw2pQxsEH-WwwOQR6Rx5rKdEY';

  // Auth(this._token, this._expiryDate, this._userId);

  Future<void> signup(String email, String password) async {
    try {
      final url = Uri.parse(firebaseSignupUrl);
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      print(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }
}
