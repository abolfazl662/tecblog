import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tecblog/screenpage/pre-made/tamrinrx.dart';

// ignore: camel_case_types
class Yadgiricontroller extends GetxController {
  Rx <Tamrinrx> tamrin = Tamrinrx(name: "تیتاب", price: "120", off: "0.000001").obs;
  Yadgiricontroller ({required this.tamrin});
}