// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontroller.dart';

// ignore: must_be_immutable
class Yadgiricontrollerpage extends StatelessWidget {
  Yadgiricontrollerpage({super.key});
  Yadgiricontroller yadgiricontroller = Get.put(Yadgiricontroller(yadgiricontroller: Tamrinrx(name: "kechap", price: "15", off:"77").obs));
  //Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
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
                  Text(yadgiricontroller.yadgiricontroller.value.name,style: TextStyle(color: Colors.black),),
                  Text(yadgiricontroller.yadgiricontroller.value.price),
                  Text(yadgiricontroller.yadgiricontroller.value.off),
                ],
              );
            }),
            ElevatedButton(onPressed: () {
             yadgiricontroller.yadgiricontroller.update(
              (val) {
                val!.name = "شیر کوکاعین";
              },
             );
            }, child: Text("seek")),

             ElevatedButton(onPressed: () {
              Get.back();
            }, child: Text("back")),
          ],
        ),
      ),
    );
  }
}