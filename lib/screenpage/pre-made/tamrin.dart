import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';

// ignore: must_be_immutable
class Tamrin extends StatelessWidget {
  Tamrin({super.key});
  Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
  RxBool showd = false.obs;
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
                  showd.isTrue?Text("im father tec blog"):Icon(Icons.car_crash),
                  Text(tamrinRX.value.name),
                  Text(tamrinRX.value.price),
                  Text(tamrinRX.value.off),
                ],
              );
            }),
            ElevatedButton(onPressed: () {
              tamrinRX.update((val) {
                val!.name="سرور ایران پهلوی";
                showd.isTrue?showd.value=false:showd.value=true;
              },);
            }, child: Text("seek")),
          ],
        ),
      ),
    );
  }
}
