import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  String _message = '';
  final AuthService _authService = AuthService();

  String? get message => _message;
  User? get user => _user;
  bool get isAuth {
    return _user != null;
  }

  Future<void> login(String email, String password) async {
    Map<String, dynamic> dataApi = await _authService.login(email, password);
    if (dataApi.isNotEmpty) {
      if (dataApi['status']) {
        _user = User.fromJson(dataApi['data']);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('userData', json.encode(_user!.toJson()));
        _message = '';
      } else {
        _message = dataApi['message'];
      }
    }

    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    _message = '';

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');

    notifyListeners();
  }

  Future<bool> cekLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    _user = User.fromJson(extractedUserData);

    notifyListeners();
    return true;
  }
}
