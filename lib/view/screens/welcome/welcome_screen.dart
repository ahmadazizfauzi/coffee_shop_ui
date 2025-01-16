import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee/view/widgets/reusable/big_button_widget.dart';
import 'package:coffee/model/data/data_image.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image coffee
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Image.asset(
              DataImage.welcomeCoffee,
              fit: BoxFit.cover,
            ),
          ),
          // Bottom image overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              DataImage.welcomeBottom,
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Positioned(
            bottom: 54,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    "Fall in Love with Coffee in Blissful Delight",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome to our cozy coffee corner, where\nevery cup is a delight for you.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 32),
                  BigButton(
                    text: 'Get Started',
                    onPressed: () {
                      Get.offNamed('/bottombar');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
