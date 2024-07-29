import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'text_widget.dart';

class Lt {
  static void loading(String txt, {bool mask = false}) {
    setConfigLoading();
    EasyLoading.show(
      status: txt,
      maskType: (mask) ? EasyLoadingMaskType.black : null,
    );
  }

  static void toast(String txt) {
    close();
    EasyLoading.showToast(txt, toastPosition: EasyLoadingToastPosition.bottom);
  }

  static void flash(BuildContext ctx, String txt,
      {String mode = '',
      String position = 'bottom',
      Duration durShow = const Duration(seconds: 2)}) {
    close();
    switch (mode) {
      case 'info':
        _showToastIcon(ctx, txt, Icons.info, Colors.blue, position,
            durShow: durShow);
        break;
      case 'success':
        _showToastIcon(ctx, txt, Icons.check_circle, Colors.green, position,
            durShow: durShow);
        break;
      case 'warning':
        _showToastIcon(ctx, txt, Icons.warning, Colors.red, position,
            durShow: durShow);
        break;
      default:
        _showToastIcon(ctx, txt, Icons.info, Colors.blue, position,
            durShow: durShow);
    }
  }

  static void close() {
    EasyLoading.dismiss();
  }

  static void setConfigLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = const Color(0xFF4cb3f2)
      ..backgroundColor = Colors.white
      ..indicatorColor = const Color(0xFF4cb3f2)
      ..textColor = Colors.black
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}

_showToastIcon(
    BuildContext ctx, String txt, IconData icon, Color bgColor, String position,
    {Duration durShow = const Duration(seconds: 2)}) {
  FToast fToast = FToast();
  fToast.init(ctx);
  double screenWidth = MediaQuery.of(ctx).size.width;
  Widget toast = Container(
    width: screenWidth,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: bgColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: getTxt(txt,
              fontColor: Colors.white,
              fontWeight: FontWeight.w600,
              maxLine: 10),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: (position == 'bottom') ? ToastGravity.BOTTOM : ToastGravity.TOP,
    toastDuration: durShow,
  );
}
