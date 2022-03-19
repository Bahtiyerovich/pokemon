import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon/data/api.dart';
import 'package:pokemon/models/pocemon_model.dart';

class PokemonService{
  static Future<PocemonModel> getPocemon()async{
    Response res = await Dio().get(ApiData.myApi);
    return PocemonModel.fromJson(jsonDecode(res.data));
  }
}