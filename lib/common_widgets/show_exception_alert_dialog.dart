
import 'package:flutter/material.dart';
import 'package:partners_mobile_application/common_widgets/show_alert_dialog.dart';

Future<void> showExceptionAlertDialog(
  BuildContext context, {
  @required String title,
  @required Exception exception,
}) =>
    showAlertDialog(
      context,
      title: title,
      content: _message(exception),
      defaultActionText: 'OK',
    );

String _message(Exception exception) {
  if (exception is Exception) {
    return exception.toString();
  }
  return exception.toString();
}