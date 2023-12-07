import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  final Function() onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(text),
      ),
    );
  }
}
