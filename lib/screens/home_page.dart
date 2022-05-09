import 'package:flutter/material.dart';
import 'package:smallcurrency/base/baseview.dart';
import 'package:smallcurrency/core/extensions/mediaquery_extension.dart';
import 'package:smallcurrency/models/model.dart';
import 'package:smallcurrency/service/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: HomePage,
      onPageBuildre: (context, widget) => Scaffold(
        body: FutureBuilder(
            future: CurrencyService.getService(),
            builder: (context, AsyncSnapshot<List<Model>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("No internet"),
                );
              } else {
                var data = snapshot.data;
                debugPrint("keldi");
                return Column(
                  children: [
                    SizedBox(
                      height: context.heig * 0.03,
                    ),
                    const Text(
                      "Currency",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: context.heig * 0.01,
                    ),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          height: context.heig * 0.1,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data![index].code.toString(),
                                ),
                              ),
                              Text(data[index].cbPrice.toString())
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
