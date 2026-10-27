import 'dart:ui' show lerpDouble;
import 'package:athaar_app/home/onboarding/onboarding_screen.dart';
import 'package:athaar_app/utils/app_image.dart';
import 'package:athaar_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<double> _eyeOpacity;
  late final Animation<double> _eyeScale;
  late final Animation<double> _eyeMove;
  late final Animation<double> _textOpacity;
  late final Animation<double> _textMove;
  late final Animation<double> _glow;
  static const Color _background = Color(0xFF15191C);
  static const Color _gold = Color(0xFFD6AD55);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    _eyeOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.23, curve: Curves.easeIn),
    );

    _eyeScale = Tween<double>(begin: 1.0, end: 0.55).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.23, 0.52, curve: Curves.easeInOutCubic),
      ),
    );

    _eyeMove = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.23, 0.52, curve: Curves.easeInOutCubic),
    );

    _textOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.36, 0.63, curve: Curves.easeIn),
    );

    _textMove = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.36, 0.63, curve: Curves.easeOutCubic),
    );

    _glow = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.05, 0.35, curve: Curves.easeInOut),
    );

    _controller.forward().whenComplete(_openLogin);
  }

  void _openLogin() {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        pageBuilder: (context, animation, secondaryAnimation) {
          return OnBoardingScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
            final centerX = screenWidth / 2;
            final centerY = screenHeight / 2;
            final initialEyeSize = screenWidth * 0.38;
            final finalEyeSize = screenWidth * 0.20;
            final eyeStartLeft = centerX - initialEyeSize / 2;
            final eyeEndLeft = centerX - screenWidth * 0.255;
            final textWidth = screenWidth * 0.43;
            final textEndLeft = centerX + screenWidth * 0.005;
            final textStartLeft = screenWidth + 20.0;
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final eyeSize = lerpDouble(
                  initialEyeSize,
                  finalEyeSize,
                  _eyeMove.value,
                )!;
                final eyeLeft = lerpDouble(
                  eyeStartLeft,
                  eyeEndLeft,
                  _eyeMove.value,
                )!;
                final textLeft = lerpDouble(
                  textStartLeft,
                  textEndLeft,
                  _textMove.value,
                )!;
                return Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned(
                      left: eyeLeft,
                      top: centerY - eyeSize / 2,
                      width: eyeSize,
                      height: eyeSize,
                      child: Opacity(
                        opacity: _eyeOpacity.value,
                        child: Transform.scale(
                          scale:
                              _eyeScale.value /
                              lerpDouble(1.0, 0.55, _eyeMove.value)!,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: _gold.withOpacity(0.24 * _glow.value),
                                  blurRadius: 28 * _glow.value,
                                  spreadRadius: 2 * _glow.value,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              AppImage.horusLogo,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: textLeft,
                      top: centerY - 25,
                      width: textWidth,
                      child: Opacity(
                        opacity: _textOpacity.value,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ATHAR',
                            maxLines: 1,
                            style: GoogleFonts.cinzel(
                                fontSize: 48,
                                color: const Color(0xffd4af37),
                                fontWeight: FontWeight.bold

                            ),
                          )
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
