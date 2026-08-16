import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messhubapp/presentation/screens/authentication/signup.dart';
import 'package:messhubapp/presentation/widgets/colors.dart';
import 'package:messhubapp/presentation/widgets/utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ).drive(Tween<double>(begin: 0.7, end: 1.0));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ).drive(Tween<double>(begin: 0.0, end: 1.0));

    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: splashgradient),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: -60,
              child: PurpleContainer(height: 220, width: 220),
            ),
            Positioned(
              bottom: -80,
              left: -40,
              child: PurpleContainer(height: 260, width: 260),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [accentOrange, accentYellow],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accentOrange,
                            blurRadius: 30,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Icon(Icons.takeout_dining, size: 72, color: white),
                    ),
                    height25,
                    Text(
                      'Mess Hub',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        color: white,
                      ),
                    ),
                    height10,
                    Text(
                      'Fresh meals. Fast delivery.',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.1,
                        color: white.withValues(alpha: 0.75),
                      ),
                    ),
                    height35,
                    SizedBox(
                      width: size.width * 0.38,
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        backgroundColor: white,
                        valueColor: AlwaysStoppedAnimation<Color>(accentYellow),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PurpleContainer extends StatelessWidget {
  final height;
  final width;
  const PurpleContainer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF9D4EDD).withValues(alpha: 0.18),
      ),
    );
  }
}
