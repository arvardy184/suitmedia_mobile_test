import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/config/app_routes.dart';
import 'package:suitmedia_mobile_test/modules/second/controllers/second_controller.dart';
import 'package:suitmedia_mobile_test/widgets/my_app_bar.dart';

class SecondScreen extends GetView<SecondController> {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const MyAppBar(title: 'Second Screen'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome', style: Theme.of(context).textTheme.bodySmall),
                 Text(
                    Get.arguments ?? 'No Name',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600,fontSize: 18),
                  ),
                ],
              ),
            ),
              Expanded(
              child: Center(
                child: Obx(() => Text(
                      controller.selectedUser.value?.firstName ?? 'Selected User Name',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
              onPressed: () {
                Get.toNamed(AppRoutes.third);
              }, child: const Text('Choose a User')),
        ),
      );
}
