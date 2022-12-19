import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        (_expiryDate as DateTime).isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

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

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(responseData['expiresIn'])),
      );
      notifyListeners();
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
