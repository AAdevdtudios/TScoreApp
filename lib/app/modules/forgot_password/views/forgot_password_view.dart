import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/data/components/BackTab.dart';
import 'package:tscore_app/app/data/components/Header.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FastContent(
          children: [
            const BackTab(tabName: "Forgot Password"),
            const Header(
              subtitle: "Please check your email to reset your password",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Email",
            ),
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                labelStyle: Get.textTheme.bodySmall,
                hintText: "email@email.com",
              ),
              validator: (s) => GetUtils.isEmail(s!) ? null : "Invalid Email",
            ),
            const SizedBox(
              height: 20,
            ),
            FastButton(
              label: "Send reset token",
              background: Colors.blue,
              onPressed: () {
                context.showMessage(
                  "This is just a message",
                  position: MessagePosition.bottom,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
