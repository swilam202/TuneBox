
import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key,required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(errorMessage,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),softWrap: true,),
    );
  }
}