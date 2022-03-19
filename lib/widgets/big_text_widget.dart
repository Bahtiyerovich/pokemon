import 'package:flutter/material.dart';
import 'package:pokemon/core/components/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow? overFlow;
  int? maxLines;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overFlow,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
