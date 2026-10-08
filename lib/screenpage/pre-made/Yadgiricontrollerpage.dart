// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/tamringetx.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontroller.dart';

// ignore: must_be_immutable
class Yadgiricontrollerpage extends StatelessWidget {
  Yadgiricontrollerpage({super.key});
  
  //Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
  // ignore: non_constant_identifier_names
  Yadgiricontroller Tamrin = Get.put(Yadgiricontroller(tamrin: Tamrinrx(name: "ادامس", price: "", off: "").obs));
  RxBool onkossher = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                children: [
                  //onkossher.isTrue?Text("data"):Icon(Icons.ice_skating),
                  Text(Tamrin.tamrin.value.name),
                  Text(""),
                  Text(""),
                ],
              );
            }),
            ElevatedButton(onPressed: () {
            Tamrin.tamrin.update((val) {
              val!.name = "کاندوم";
            },);
            }, child: Text("seek")),

             ElevatedButton(onPressed: () {
              Get.back();
            }, child: Text("back")),
            ElevatedButton(
              onPressed: () {
                Get.to(Tamringetx());
              },
              child: Text("getgo"),
            ),
          ],
        ),
      ),
    );
  }
}