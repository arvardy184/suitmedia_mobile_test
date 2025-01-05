import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/modules/first/controllers/first_controller.dart';

class FirstScreen extends GetView<FirstController> {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/first_background.png',
          height: Get.height,
          fit: BoxFit.cover,
        ),
        Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Image.asset(
                  'assets/images/icon_photo.png',
                  height: 116.0,
                  width: 116.0,
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.palindromeController,
                  decoration: const InputDecoration(
                    hintText: 'Palindrome',
                  ),
                  // onEditingComplete: controller.checkPalindrome,
                ),
                const SizedBox(height: 48),
                FilledButton(
                    onPressed: controller.checkPalindrome,
                    child: const Text('CHECK')),
                const SizedBox(height: 16),
                FilledButton(
                    onPressed: controller.goToSecondScreen,
                    child: const Text('NEXT'))
              ]),
        )
      ],
    ));
  }
}
