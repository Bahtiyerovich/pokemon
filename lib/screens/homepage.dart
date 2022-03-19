import 'package:flutter/material.dart';
import 'package:pokemon/core/components/decoration.dart';
import 'package:pokemon/core/components/dimensions.dart';
import 'package:pokemon/core/constants/colors.dart';
import 'package:pokemon/models/pocemon_model.dart';
import 'package:pokemon/service/pokemon_service.dart';
import 'package:pokemon/widgets/app_bar_widget.dart';
import 'package:pokemon/widgets/big_text_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
          future: PokemonService.getPocemon(),
          builder: (context, AsyncSnapshot<PocemonModel> snap) {
            if (!snap.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snap.hasError) {
              return const Center(
                child: Text('ERROR'),
              );
            } else {
              var data = snap.data!;
              return Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              'assets/images/image1.png',
                              width: Dimensions.width11,
                            ),
                          ),
                          SearchingField(
                              controller: _controller,
                              isTrue: false,
                              model: data.pokemon as List<Pokemon>),
                        ],
                      )),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        right: Dimensions.width10,
                        left: Dimensions.width10,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: Dimensions.height30*6,
                          crossAxisSpacing: Dimensions.width15,
                          mainAxisSpacing: Dimensions.width15,
                        ),
                        itemBuilder: (contex, index) {
                          return Stack(children: [
                            Container(
                              height: Dimensions.height30 * 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      height: Dimensions.height120,
                                      width: Dimensions.screenWidth,
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          height: Dimensions.height40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                text:
                                                    "#${data.pokemon![index].num}",
                                                color: MyColor.kPrimaryColor,
                                                size: Dimensions.font16,
                                              ),
                                              BigText(
                                                text:
                                                    "${data.pokemon![index].name}",
                                                overFlow: TextOverflow.clip,
                                                maxLines: 1,
                                                color: MyColor.kWhite,
                                                size: Dimensions.font16,
                                                
                                              )
                                            ],
                                          ),
                                          decoration:
                                              MyBoxDecoration.boxDecoration(
                                                  color: MyColor.kPrimaryGrey),
                                        ),
                                      ),
                                      decoration: MyBoxDecoration.boxDecoration(
                                          color: MyColor.kPrimaryColor)),
                                ],
                              ),
                              // child: MyText(text: data.pokemon![i].name.toString())
                            ),
                            Positioned(
                              child: Container(
                                height: Dimensions.height40 * 3.3,
                                width: Dimensions.screenWidth,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data.pokemon![index].img.toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                        itemCount: data.pokemon!.length,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
