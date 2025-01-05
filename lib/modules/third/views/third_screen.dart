import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/modules/second/controllers/second_controller.dart';
import 'package:suitmedia_mobile_test/widgets/my_app_bar.dart';
import 'package:suitmedia_mobile_test/widgets/user_list_item.dart';

class ThirdScreen extends GetView<SecondController> {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: 'Third Screen'),
        body: Obx(() {
          if (controller.isLoading.value && controller.users.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!controller.isLoading.value && controller.users.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          return RefreshIndicator(
              onRefresh: controller.onRefresh,
              child: ListView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.users.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.users.length) {
                      if (controller.isFetchingNextPage.value) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }
                    final user = controller.users[index];
                    return UserListItem(
                      user: user,
                      isSelected: user == controller.selectedUser.value,
                      onTap: () => controller.setSelectedUser(user),
                    );
                  }));
        }));
  }
}
