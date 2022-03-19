import 'package:get/get.dart';

class Dimensions {
  // iphone 13 pro
  // h=844.0
  // w=390.0
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//height
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.14;
  static double height40 = screenHeight / 21.1;
  static double height50 = screenHeight / 16.88;
  static double height120 = screenHeight / 7.04;
  static double height200 = screenHeight / 4.22;

//fonts
  static double font15 = screenHeight / 56.27;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;

//icons
  static double icon16 = screenHeight / 13.5;
  static double icon24 = screenHeight / 20.26;

  //width

  static double width10 = screenWidth / 39;
  static double width15 = screenWidth / 26;
  static double width20 = screenWidth / 19.5;
  static double width30 = screenWidth / 13;
  static double width11 = screenWidth / 1.4;

// radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius25 = screenHeight / 33.76;

}
