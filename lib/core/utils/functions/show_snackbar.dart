import 'package:flutter/material.dart';

enum SnackBarType {
  error,
  success,
  info,
}

void showSnackBar(BuildContext context, String message, SnackBarType type) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(_getSnackBarIcon(type), color: Colors.white),
        const SizedBox(width: 8),
        Expanded(
          child: Text(message),
        ),
      ],
    ),
    backgroundColor: _getSnackBarColor(type),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

IconData _getSnackBarIcon(SnackBarType type) {
  switch (type) {
    case SnackBarType.error:
      return Icons.error_outline;
    case SnackBarType.success:
      return Icons.check_circle_outline;
    case SnackBarType.info:
      return Icons.info_outline;
    default:
      return Icons.info_outline;
  }
}

Color _getSnackBarColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.error:
      return Colors.red;
    case SnackBarType.success:
      return Colors.green;
    case SnackBarType.info:
      return Colors.blue;
    default:
      return Colors.black;
  }
}
