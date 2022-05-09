import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smallcurrency/core/extensions/mediaquery_extension.dart';
import 'package:smallcurrency/models/model.dart';
import 'package:smallcurrency/service/service.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  @override
  Widget build(BuildContext context) {
    Box<Model>? box = CurrencyService.box;
    return Scaffold(
      body: Column(
        children: [
          const Text("Offline Page"),
          Expanded(child: ListView.builder(
            itemCount: box!.length,
            itemBuilder: (context, index) {
            return SizedBox(
              height: context.heig * 0.1,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: Text(box.getAt(index)!.code.toString())),
                  Text(box.getAt(index)!.cbPrice.toString()),
                ],
              ),
            );
          })),
        ],
      ),
    );
  }
}
