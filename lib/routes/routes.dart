
import 'package:flutter/material.dart';
import 'package:smallcurrency/screens/home_page.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();


  Route? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case "home":
        return MaterialPageRoute(builder: (context)=>const HomePage());
    }
  }
}