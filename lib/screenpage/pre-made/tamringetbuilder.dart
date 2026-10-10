import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/Yadgiricontrollerpage.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontrollergetbuilder.dart';

// ignore: must_be_immutable
class Tamringetbuilder extends StatelessWidget {
  
  Tamringetbuilder({super.key});
  //Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
  // 👇 for use get buider
  final controller = Get.put(YadgiricontrollerGetbuilder(tamrin: Tamrinrx(name: "سیک اول", price: "", off: "")));
  RxBool onkossher = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            //only get builde use <...>
            GetBuilder <YadgiricontrollerGetbuilder>(
              builder: (YadgiricontrollerGetbuilder yas) {
                return Column(
                  children: [
                    onkossher.isTrue ? Text("data") : Icon(Icons.ice_skating),
                    // use get builder not use value
                    Text(yas.tamrin.name),
                    Text(""),
                    Text(""),
                  ],
                );
              },
            ),
            ElevatedButton(onPressed: () {
              //dont froge ()
            Get.find<YadgiricontrollerGetbuilder>().meghdar();
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
