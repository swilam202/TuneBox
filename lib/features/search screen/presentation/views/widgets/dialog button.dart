import 'package:flutter/material.dart';


class DialogButton extends StatelessWidget {
  const DialogButton({super.key,required this.onPressed,required this.text});
final Function() onPressed;
final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: TextButton(onPressed: onPressed,child: Text(text),),);
  }
}