import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('TScore'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              FontAwesome.user,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              FontAwesome.bell,
            ),
          ),
          IconButton(
            onPressed: () async => await controller.controller.reload(),
            icon: const Icon(
              FontAwesome.circle_arrow_down_solid,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.controller.reload,
        child: const HtmlElementView(viewType: "Hello world"),
      ),
    );
  }
}
