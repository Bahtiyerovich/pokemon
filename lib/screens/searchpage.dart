import 'package:flutter/material.dart';
import 'package:pokemon/core/components/decoration.dart';
import 'package:pokemon/core/components/dimensions.dart';
import 'package:pokemon/core/constants/colors.dart';
import 'package:pokemon/models/pocemon_model.dart';
import 'package:pokemon/widgets/big_text_widget.dart';

class SearchPage extends StatefulWidget {
  List<Pokemon> pokeModel;
  SearchPage({Key? key, required this.pokeModel}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<Pokemon> searchItem = {};
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images/image1.png',
                      width: Dimensions.height30 * 6,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.screenWidth * 0.8,
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: MyColor.kGrey,
                        filled: true,
                        hintText: "Search...",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide.none),
                      ),
                      onChanged: (v) {
                        searchItem.clear();
                        for (Pokemon item in widget.pokeModel) {
                          if (v.length == 0) {
                            searchItem.clear();
                            setState(() {});
                          } else if (item.name
                              .toString()
                              .toLowerCase()
                              .contains(v.toString().toLowerCase())) {
                            searchItem.add(item);
                            setState(() {});
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(Dimensions.height20),
                          height: Dimensions.height200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: Dimensions.height50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: "#${searchItem.toList()[index].num}",
                                      color: MyColor.kPrimaryColor,
                                      size: Dimensions.font16,
                                    ),
                                    BigText(
                                      text: "${searchItem.toList()[index].name}",
                                      color: MyColor.kBlack,
                                      size: Dimensions.font16,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: Dimensions.height50 * 3,
                                decoration: MyBoxDecoration.boxDecoration(
                                  color: MyColor.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: Dimensions.width20 * 4,
                          child: Container(
                            width: Dimensions.height200,
                            height: Dimensions.height200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  searchItem.toList()[index].img.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              Container(
                                width: Dimensions.screenWidth,
                                height: Dimensions.screenHeight * 0.35,
                                decoration: BoxDecoration(
                                  color: MyColor.kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.radius20),
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  right: Dimensions.width15,
                                  left: Dimensions.width15,
                                  top: Dimensions.height20,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _showbottom(
                                            index,
                                            "Altura",
                                            searchItem
                                                .toList()[index]
                                                .height
                                                .toString()),
                                        _showbottom(
                                            index,
                                            "Name",
                                            searchItem
                                                .toList()[index]
                                                .name
                                                .toString()),
                                        _showbottom(
                                            index,
                                            "Disabilidad",
                                            searchItem
                                                .toList()[index]
                                                .weaknesses![0]
                                                .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        _showbottom(
                                            index,
                                            "Peso",
                                            searchItem
                                                .toList()[index]
                                                .weight
                                                .toString()),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: Dimensions.width10),
                                          child: _showbottom(
                                              index,
                                              "Type",
                                              searchItem
                                                  .toList()[index]
                                                  .type![0]
                                                  .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        _showbottom(
                                          index,
                                          "Candy",
                                          searchItem
                                              .toList()[index]
                                              .candy
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                width: Dimensions.width20 * 13,
                                height: Dimensions.height120,
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image2.png'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20),
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: searchItem.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _showbottom(int index, String text1, String text2) {
    return Container(
      width: Dimensions.width30 * 4,
      height: Dimensions.height40 * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text1,
            color: MyColor.kWhite,
            size: Dimensions.font20,
          ),
          BigText(
            text: text2,
            color: MyColor.kWhite,
            size: Dimensions.font15,
          ),
        ],
      ),
    );
  }
}
