import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontrollergetbuilder.dart';
import 'package:tecblog/screenpage/pre-made/yadgiricontrollergetbuilderListview.dart';

// ignore: must_be_immutable
class TamringetbuilderListviwe extends StatelessWidget {
  
  TamringetbuilderListviwe({super.key});
  //Rx <Tamrinrx> tamrinRX = Tamrinrx(name: "سرور آمریکا", price: "1.200.000", off: "0.000001٪").obs;
  // 👇 for use get buider
  final controller = Get.put(YadgiricontrollerGetbuilder(tamrin: Tamrinrx(name: "سیک اول", price: "", off: "")));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            //only get builde use <...>
            SizedBox(
              height: 700,
              child: ListView.builder( itemCount: 15, itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.find<YadgiricontrollerGetbuilderListview>().meghdarListviwe(index);
                      },
                      child: GetBuilder <YadgiricontrollerGetbuilderListview>(
                        init: YadgiricontrollerGetbuilderListview(tamrin: Tamrinrx(name: "کونی", price: "", off: "")),
                        id: index,
                      //dont froge name for (next class)
                      builder: (YadgiricontrollerGetbuilderListview yas) {
                        return Column(
                          children: [                      // use get builder not use value
                            Text(yas.tamrin.name),
                            Text(""),
                            Text(""),
                          ],
                        );
                      },
                                    ),
                    ),
                  ),
                );
              },),
            )
          
           
          ],
        ),
      ),
    );
  }
}
