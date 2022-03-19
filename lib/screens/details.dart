import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/colors.dart';
import 'package:pokemon/models/pocemon_model.dart';

class DetailsPage extends StatefulWidget {
  Pokemon? detail;

  DetailsPage({ Key? key, this.detail }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColor.kAmber,
        child: Text(widget.detail!.name.toString()),
      ),
    );
  }
}