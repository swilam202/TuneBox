import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:musicapp/core/database/sql%20database.dart';
import 'package:musicapp/features/home%20screen/presentation/views/home%20page.dart';
import 'package:musicapp/features/splash%20screen/presentation/views/widgets/splash%20body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPageBody(
        animation: animation,
      ),
    );
  }

  initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationController.forward().then(
          (value) => Future.delayed(
            const Duration(milliseconds: 1500),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>  HomePage(),
              ),
            ),
          ),
        );
  }
}
