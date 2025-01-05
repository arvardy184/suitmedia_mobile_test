import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/modules/second/controllers/second_controller.dart';

class SecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecondController());
  }
}