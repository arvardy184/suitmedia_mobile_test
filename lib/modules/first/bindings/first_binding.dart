
import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/modules/first/controllers/first_controller.dart';

class FirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirstController());
  }
}