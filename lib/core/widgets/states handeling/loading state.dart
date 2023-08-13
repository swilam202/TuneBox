import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';



class LoadignState extends StatelessWidget {
  const LoadignState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.green, size: 80,),
    );
  }
}