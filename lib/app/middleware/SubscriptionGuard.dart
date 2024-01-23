import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/routes/app_pages.dart';
import 'package:tscore_app/main.dart';

class SubscriptionGuard extends GetMiddleware {
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    //Check if token is null
    print(box.read("token"));
    if (box.read("token") == null) {
      return const RouteSettings(name: Routes.LOGIN);
    } else if (box.read("is_verified") != true) {
      return const RouteSettings(name: Routes.OTP);
    } else if (box.read("is_subscribed") != true) {
      return const RouteSettings(name: Routes.SUBSCRIPTION);
    }
    return null;
  }
}
