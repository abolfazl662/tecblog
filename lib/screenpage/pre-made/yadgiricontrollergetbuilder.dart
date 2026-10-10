import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';
//controller getbuilder 
//get builder is not < ... > and .obs
// get builder not Rx
//ture write is line 7 , 10
// ignore: camel_case_types
class YadgiricontrollerGetbuilder extends GetxController {
  Tamrinrx tamrin = Tamrinrx(name: "تیتاب", price: "120", off: "0.000001");
  YadgiricontrollerGetbuilder ({required this.tamrin});
  void meghdar (){
    tamrin = Tamrinrx(name: "سیکیمنال", price: "", off: "");
    update();
  }
}