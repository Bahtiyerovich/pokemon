import 'package:flutter/material.dart';
import 'package:pokemon/core/components/dimensions.dart';
import 'package:pokemon/core/constants/colors.dart';
import 'package:pokemon/models/pocemon_model.dart';

class SearchingField extends StatelessWidget {
  bool? isTrue;
  List<Pokemon>? model;
  SearchingField({
    Key? key,
    required TextEditingController controller,
    this.isTrue,
    this.model,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth * 0.8,
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: MyColor.kGrey,
          filled: true,
          hintText: "Search...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            borderSide: BorderSide.none,
          ),
        ),
        onTap: isTrue == false
            ? () {
                Navigator.pushNamed(context, '/search',
                    arguments: model as List<Pokemon>);
              }
            : () {},
      ),
    );
  }
}
