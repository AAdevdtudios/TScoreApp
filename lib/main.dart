import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

final box = GetStorage();
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: box.read("token") == null
          ? box.read("verified") == null
              ? AppPages.Auth
              : AppPages.NOTVerified
          : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
