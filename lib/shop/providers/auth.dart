import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late final String _token;
  late final DateTime _expiryDate;
  late final String _userId;

  final String firebaseUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:';
  final String projK = 'AIzaSyArZkfV9Jlw2pQxsEH-WwwOQR6Rx5rKdEY';

  // Auth(this._token, this._expiryDate, this._userId);

  Future<void> _authenticate(
      String email, String password, String segment) async {
    try {
      final url = Uri.parse('${firebaseUrl}${segment}?key=${projK}');
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

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
