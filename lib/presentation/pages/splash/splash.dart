import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/util/assets.dart';
import 'package:sign_up_with_getx/presentation/controllers/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: AnimatedLogo(),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ScaleTransition(
      scale: Tween<double>(begin: .9, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      ),
      child: Assets.images.logo.svg(
        width: 160,
        color: Colors.white,
      ),
    );
  }
}
