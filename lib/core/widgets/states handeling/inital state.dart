import 'package:flutter/material.dart';

class InitialState extends StatelessWidget {
  const InitialState({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        softWrap: true,
      ),
    );
  }
}
