import 'package:flutter/material.dart';

import 'loading_widget.dart';

class RouteTrack {
  static open(BuildContext context, String route, {Object? arguments}) {
    if (arguments != null) {
      Navigator.pushNamed(context, route, arguments: arguments);
      Lt.close();
    } else {
      Navigator.pushNamed(context, route);
      Lt.close();
    }
  }

  static openWithRes(BuildContext context, String route,
      {Object? arguments, Function? fun}) {
    if (arguments != null) {
      Navigator.pushNamed(context, route, arguments: arguments).then((value) {
        if (fun != null) {
          fun();
        }
      });
    } else {
      Navigator.pushNamed(context, route).then((value) {
        if (fun != null) {
          fun();
        }
      });
    }
  }

  static close(BuildContext context) {
    Navigator.of(context).pop();
  }

  static push(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static Future<bool> closeConfirm(
      BuildContext context, Function function) async {
    function();
    return true;
  }
}
