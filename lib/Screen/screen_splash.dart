import 'package:aplikasi_keuangan/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false)
        });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/splash.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          SafeArea(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 41)),
                Image.asset(
                  'assets/images/Logo.png',
                  width: 144,
                  height: 22,
                ),
                const SizedBox(
                  height: 72,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Helping you \nto keep",
                        style: GoogleFonts.manrope(
                            fontSize: 28, color: const Color(0xffDEE1FE)),
                        children: const [
                          TextSpan(
                            text: " your bestie",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '\nstay healthy!')
                        ])),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
