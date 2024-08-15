import 'dart:async';
import 'dart:ui';

import 'package:employee_management/employee/Emplogin.dart';
import 'package:employee_management/employee/empsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:employee_management/color/color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => EmpLogin());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String text = 'Nexa CRM';

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     colors: [Colors.orange, ColorPage.buttoncolor1])
                // image: DecorationImage(
                //   image: AssetImage('assets/app_icon/4.jpg'),
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
          // Apply blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 20.0),
            child: Container(
              color: Colors.black.withOpacity(0), // Optional: Adjust opacity
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    'assets/app_icon/logoentry.png',
                  ),
                ),
                // SizedBox(height: 20),
                // AnimatedBuilder(
                //   animation: _controller,
                //   builder: (context, child) {
                //     double animationValue = _controller.value;
                //     if (animationValue < 0.4) return Container();

                //     int charCount =
                //         ((animationValue - 0.4) / 0.6 * text.length).round();
                //     String visibleText = text.substring(0, charCount);

                //     return ShaderMask(
                //       shaderCallback: (rect) {
                //         return LinearGradient(
                //           begin: Alignment.topLeft,
                //           end: Alignment.bottomRight,
                //           colors: [
                //             ColorPage.buttoncolor1,
                //             const Color.fromARGB(255, 250, 17, 9),
                //           ],
                //         ).createShader(rect);
                //       },
                //       child: Text(
                //         visibleText,
                //         style: GoogleFonts.dancingScript(
                //           textStyle: TextStyle(
                //             fontSize: 40,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
