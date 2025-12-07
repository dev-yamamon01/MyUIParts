import 'dart:ffi';

import 'package:flutter/material.dart';

class AlertInfoDialog extends StatelessWidget {
  final bool isSuccess;
  final bool isError;
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback? onButtonPressed;


  const AlertInfoDialog({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
    this.onButtonPressed,
    required this.isSuccess,
    required this.isError
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSuccess ?
            Icons.check_circle_outline :
            isError ? Icons.error_outline :
            Icons.info_outline,
            color: isSuccess ? Colors.green :
            isError ? Colors.redAccent : Colors.grey
            ,
          ),
          SizedBox(width: 10,),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          )
        ],),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            onButtonPressed?.call();
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
