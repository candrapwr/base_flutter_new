import 'package:flutter/material.dart';
import '../extensions/auth_extension.dart';
import '../helpers/loading_widget.dart';
import '../helpers/route_track.dart';

Future<void> login(BuildContext context, String email, String password) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    await context.auth().login(email, password);
    if (context.mounted) {
      if (context.auth().message != '') {
        Lt.flash(context, context.auth().message!, mode: 'warning');
      } else {
        checkLogin(context);
      }
    }
  } else {
    Lt.flash(context, 'lengkapi user dan password', mode: 'warning');
  }
}

Future<void> checkLogin(BuildContext context) async {
  await context.auth().cekLogin();
  if (context.mounted) {
    if (context.auth().isAuth) {
      RouteTrack.close(context);
      RouteTrack.open(context, "/Home");
    }
  }
}

Future<void> logout(BuildContext context) async {
  try {
    await context.auth().logout();
    if (context.mounted) {
      RouteTrack.close(context);
      RouteTrack.open(context, "/Login");
    }
  } catch (e) {
    if (context.mounted) {
      Lt.toast('Logout failed: $e');
    }
  }
}
