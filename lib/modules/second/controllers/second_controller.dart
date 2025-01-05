import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile_test/config/app_routes.dart';
import 'package:suitmedia_mobile_test/data/models/user_model.dart';
import 'package:suitmedia_mobile_test/data/providers/user_provider.dart';

class SecondController extends GetxController {
  final scrollController = ScrollController();
  final users = <User>[].obs;
  final selectedUser = Rxn<User>();
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final isFetchingNextPage = false.obs;
  final isLoading = false.obs;

  final UserProvider userProvider = UserProvider();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    initializeData();
  }

void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !isFetchingNextPage.value &&
        currentPage.value <= totalPages.value) {
      fetchNextPage();
    }
  }

  Future<void> initializeData() async {
    try {
      isLoading.value = true;
      users.clear();
      currentPage.value = 1;
      await fetchUsers();
    } catch (e) {
      AlertDialog(
        title: const Text('Error'),
        content: Text(e.toString()),
        actions: [
          FilledButton(
            onPressed: () => Get.back(),
            child: const Text('Ok'),
          ),
        ],
      );
    }finally{
      isLoading.value = false;
    }
  }

  Future<void> fetchUsers() async {
    if (isFetchingNextPage.value) return;

    if (currentPage.value > totalPages.value) return;

    isFetchingNextPage.value = true;

    try {
      final newUsers = await userProvider.getUsers(currentPage.value, 10);
      users.addAll(newUsers);
      currentPage.value++;
    } catch (e) {
       Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            FilledButton(
              onPressed: () => Get.back(),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } finally{
      isFetchingNextPage.value = false;
    }
  }

  Future<void> fetchNextPage() async {
    await fetchUsers();
  }

  void setSelectedUser(User user) {
    selectedUser.value = user;
    Get.back();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> onRefresh() async {
    await initializeData();
  }

  void goToThirdScreen(){
    Get.toNamed(AppRoutes.third);
  }
}
