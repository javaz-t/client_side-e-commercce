import 'package:client_side/controller/login_controller.dart';
import 'package:client_side/pages/buy_page.dart';
import 'package:client_side/pages/home_page.dart';
import 'package:client_side/pages/login_page.dart';
import 'package:client_side/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/home_page_controller.dart';
import 'firebase_options.dart';
Future<void> main() async {
  GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ///=============================
  Get.put(LoginController());
  Get.put(HomePageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

