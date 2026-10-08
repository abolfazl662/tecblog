import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/Yadgiricontrollerpage.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontroller.dart';

// ignore: must_be_immutable
class Tamrin extends StatelessWidget {
  Tamrin({super.key});
  //Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
  Yadgiricontroller yadgiricontroller = Get.put(Yadgiricontroller(yadgiricontroller: Tamrinrx(name: "خز", price: "", off: "").obs));
  RxBool onkossher = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                children: [
                  onkossher.isTrue?Text("data"):Icon(Icons.ice_skating),
                  Text(yadgiricontroller.yadgiricontroller.value.name),
                  Text(""),
                  Text(""),
                ],
              );
            }),
            ElevatedButton(onPressed: () {
             yadgiricontroller.yadgiricontroller.update((val) {
               val!.name="شیر سیگار";
             },);
            }, child: Text("seek")),
            ElevatedButton(
              onPressed: () {
                Get.to(Yadgiricontrollerpage());
              },
              child: Text("next"),
            ),
          ],
        ),
      ),
    );
  }
}
