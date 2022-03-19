import 'package:flutter/material.dart';

class MyColor{
  static Color kPrimaryColor = const Color(0XFFFA5AFD);
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color kPurple = const Color(0XFF9F30F6);
  static Color kPrimaryGrey = const Color(0XFF676767);
  static Color kGrey = Colors.grey.shade300;
  static Color kAmber = const Color(0XFFFFC107);


}

class GradientColor{
  static  LinearGradient gradientColor = LinearGradient(colors: [ MyColor.kPurple, MyColor.kPrimaryColor], begin: Alignment.topLeft);
}