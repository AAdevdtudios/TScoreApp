import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/data/components/Header.dart';
import 'package:tscore_app/app/data/components/TextInputForm.dart';
import 'package:tscore_app/app/data/const/components.dart';
import 'package:tscore_app/app/modules/login/views/login_view.dart';
import 'package:tscore_app/main.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OtpController());
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formState,
          child: FastContent(
            children: [
              spaceH_5,
              Header(
                title: "OTP",
                subtitle:
                    "A 6 digit code has been sent to your email ${box.read("email")}",
              ),
              spaceH_5,
              TextInputForm(
                hint: "****",
                borderRadius: BorderRadius.circular(10),
                controller: controller.otp,
                isPassword: true,
                validator: (s) => GetUtils.isNull(s)
                    ? "This field is required"
                    : GetUtils.isLengthLessThan(s, 6)
                        ? "Too Short"
                        : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.resendOtp(),
                    child: const Text("Resend OTP"),
                  ),
                  TextButton(
                    onPressed: () => Get.off(const LoginView()),
                    child: const Text("Login"),
                  ),
                ],
              ),
              spaceH_5,
              Obx(() {
                return FastButton(
                  label: controller.isLoading.value ? "Loading..." : "Verify",
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.verifyOtp(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
