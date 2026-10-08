import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/Yadgiricontrollerpage.dart';
import 'package:tecblog/screenpage/pre-made/tamrin.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontroller.dart';

// ignore: must_be_immutable
class Tamringetx extends StatelessWidget {
  Tamringetx({super.key});
  //Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
  RxBool onkossher = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX(
              builder: (Yadgiricontroller yas) {
                return Column(
                  children: [
                    onkossher.isTrue ? Text("data") : Icon(Icons.ice_skating),
                    Text(yas.tamrin.value.name),
                    Text(""),
                    Text(""),
                  ],
                );
              },
            ),
            ElevatedButton(onPressed: () {
             Get.find<Yadgiricontroller>().tamrin.update((val) {
               val!.name="im live in iran ";
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
