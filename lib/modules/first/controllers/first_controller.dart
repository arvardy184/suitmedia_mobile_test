import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/config/app_routes.dart';

class FirstController extends GetxController {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  void checkPalindrome() {
    final text = palindromeController.text.trim();

    if (text.isEmpty) {
      Get.snackbar(
        'Error',
        'Palindrome is still empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.dialog(
      AlertDialog(
        title: Text(isPalindrome(text) ? 'isPalindrome' : 'not palindrome'),
        actions: [
          FilledButton(
            onPressed: () => Get.back(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void goToSecondScreen() {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Name is still empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    Get.toNamed(AppRoutes.second, arguments: nameController.text);
  }

  bool isPalindrome(String text) {
    //hilangin spasi, jadiin lowercase
    String cleanText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();

    //reverse
    String reversed = cleanText.split('').reversed.join('');
    return cleanText == reversed;
  }

  @override
  void onClose() {
    nameController.dispose();
    palindromeController.dispose();
    super.onClose();
  }
}
