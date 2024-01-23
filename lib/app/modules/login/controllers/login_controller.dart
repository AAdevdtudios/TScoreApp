import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/Services/ApiService.dart';
import 'package:tscore_app/app/modules/home/views/home_view.dart';
import 'package:tscore_app/app/modules/otp/views/otp_view.dart';
import 'package:tscore_app/app/modules/subscription/views/subscription_view.dart';
import 'package:tscore_app/main.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLoading = false.obs;
  Future loginUser(BuildContext context) async {
    isLoading.value = true;
    await ApiServices().login({
      "email": email.text,
      "password": password.text,
    }).then((value) {
      isLoading.value = false;
      if (box.read("is_verified") == false) {
        Get.offAll(const OtpView());
        return;
      } else if (box.read("is_subscribed") == false) {
        Get.offAll(const SubscriptionView());
        return;
      }
      Get.offAll(const HomeView());
      return;
    }).catchError((error) {
      isLoading.value = false;
      context.showMessage(
        error,
        type: MessageVariant.error,
        position: MessagePosition.bottom,
      );
    });
    return;
  }
}
