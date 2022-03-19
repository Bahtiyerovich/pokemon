import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/routes/my_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute _myRoute = MyRoute();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}
