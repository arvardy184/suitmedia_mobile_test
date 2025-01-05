import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:suitmedia_mobile_test/config/app_routes.dart';
import 'package:suitmedia_mobile_test/config/app_themes.dart';
import 'package:suitmedia_mobile_test/modules/first/views/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Test Intern Suitmedia',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.first,
        getPages: AppRoutes.pages,
        theme: AppThemes.light,
       );
  }
}
