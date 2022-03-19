import 'package:flutter/material.dart';
import 'package:pokemon/core/components/dimensions.dart';

class MyBoxDecoration{
  static boxDecoration({Color? color}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius15),
      color: color,
    );
  }
}