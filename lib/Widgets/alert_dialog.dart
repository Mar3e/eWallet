import 'package:flutter/material.dart';

class ShowAlertDialog {
  AlertDialog _alertDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('حسناً'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showAlert({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => _alertDialog(
        title: title,
        content: content,
        context: context,
      ),
    );
  }
}
