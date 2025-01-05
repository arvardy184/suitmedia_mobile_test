import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/modules/first/bindings/first_binding.dart';
import 'package:suitmedia_mobile_test/modules/first/views/first_screen.dart';
import 'package:suitmedia_mobile_test/modules/second/bindings/second_binding.dart';
import 'package:suitmedia_mobile_test/modules/second/views/second_screen.dart';
import 'package:suitmedia_mobile_test/modules/third/views/third_screen.dart';

class AppRoutes {
  static const String first = '/first';
  static const String second = '/second';
  static const String third = '/third';

  static final pages = [
    GetPage(name: first, page: () => const  FirstScreen(),binding: FirstBinding()),
    GetPage(name: second, page: () => const SecondScreen(),binding: SecondBinding(),transition: Transition.fadeIn),
    GetPage(name: third, page: () => const ThirdScreen(),binding: SecondBinding(),transition: Transition.downToUp),
  ];
}