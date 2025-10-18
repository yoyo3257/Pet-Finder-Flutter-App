import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:pet_finder_app/features/presentation/screens/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ViewScreen()),
      );
    });
  }

  Widget svg = SvgPicture.asset(
    'assets/logo.svg',
    semanticsLabel: 'App Logo',
    height: 181.33663940429688,
    width: 203.5,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 86, vertical: 315),
        child: svg,
      ),
    );
  }
}
