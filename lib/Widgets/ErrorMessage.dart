import 'package:cinema_ai/Widgets/textWidget.dart';
import 'package:flutter/material.dart';

class ErrorMessage {
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextWidget(
          label: message,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
