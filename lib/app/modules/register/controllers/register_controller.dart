import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/Services/ApiService.dart';
import 'package:tscore_app/app/modules/otp/views/otp_view.dart';

class RegisterController extends GetxController {
  var formState = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool isLoading = false.obs;

  validateData(BuildContext context) async {
    if (formState.currentState!.validate()) {
      Map<String, dynamic> data = {
        "email": email.text,
        "first_name": firstname.text,
        "last_name": lastname.text,
        "password": password.text,
        "password2": confirmPassword.text,
        "isWebsite": false,
      };
      isLoading.value = true;
      bool result = await ApiServices().registerUser(data);
      isLoading.value = false;
      if (!result) {
        Get.snackbar(
          "Error",
          "Invalid credentials or your account hasn't been activated",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      Get.offAll(const OtpView());
    }
  }
}
