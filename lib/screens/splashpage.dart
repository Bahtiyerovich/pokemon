import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon/core/components/dimensions.dart';
import 'package:pokemon/core/constants/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(
        context,
        '/home',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Stack(
            children: [
              Positioned(
                top: Dimensions.height40*2,
                child: SizedBox(
                  height: Dimensions.height200,
                  width: Dimensions.screenWidth,
                  child: Image.asset('assets/images/image6.png'),
                ),
              ),
              Positioned(
                bottom: -10,
                child: SizedBox(
                  height: Dimensions.screenHeight/2,
                  width: Dimensions.screenWidth,
                  child: Image.asset(
                    'assets/images/image5.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: GradientColor.gradientColor,
          )),
    );
  }
}
