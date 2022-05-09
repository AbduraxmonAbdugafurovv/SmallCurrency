import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smallcurrency/models/model.dart';

class CurrencyService {
  static  Future<List<Model>> getService()async{
    Response res = await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
    List<Model> AllData = (res.data as List).map((e) => Model.fromJson(e)).toList();
    debugPrint("Ketti");
    await addToBox(AllData);
     debugPrint("Bovoldi");
     debugPrint(box!.getAt(1)!.code.toString());
    return AllData;
  }
  static Box<Model>? box;
  static Future openBox()async{
    box = await Hive.openBox("box");
  }

  static addToBox(data)async{
    await box!.clear();
    for (var item in data) {
      box!.add(item);
    }
     debugPrint("Bovotti");
  }

  static registerAdapter(){
    Hive.registerAdapter(ModelAdapter());
  }
}