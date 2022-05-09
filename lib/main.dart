import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:smallcurrency/routes/routes.dart';
import 'package:smallcurrency/service/service.dart';

void main()async {
await Hive.initFlutter();
await CurrencyService.registerAdapter();
await CurrencyService.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Small Currency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "home",
      onGenerateRoute:MyRoute.instance.onGenerateRoute,
    );
  }
}
