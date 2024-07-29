import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

extension AuthExtension on BuildContext {
  AuthProvider auth({bool l = false}) =>
      Provider.of<AuthProvider>(this, listen: l);
}
