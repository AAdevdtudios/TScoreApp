import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/Services/ApiService.dart';
import 'package:tscore_app/app/modules/home/views/home_view.dart';
import 'package:tscore_app/main.dart';

class OtpController extends GetxController {
  TextEditingController otp = TextEditingController();
  var formState = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  verifyOtp() async {
    if (!formState.currentState!.validate()) {
      return;
    }
    Map<String, dynamic> data = {"otp": otp.text, "email": box.read("email")};
    isLoading.value = true;
    try {
      var res = await ApiServices().verifyOtp(data);
      isLoading.value = false;
      if (res) {
        Get.offAll(const HomeView());
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
    isLoading.value = false;
  }

  resendOtp() async {
    try {
      Map<String, dynamic> data = {"email": box.read("email")};
      await ApiServices().resendOtp(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return;
    }
  }
}
