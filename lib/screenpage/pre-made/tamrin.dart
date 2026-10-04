import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Tamrin extends StatelessWidget {
  Tamrin({super.key});
  var sick =0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text("سلام$sick");
            },),
           ElevatedButton(onPressed: () {
              sick=sick+1;
            }, child: Text("seek"))
            
          ],
        ),
      ),
    );
  }
  
}