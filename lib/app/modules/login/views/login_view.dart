import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:tscore_app/app/modules/register/views/register_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FastContent(
          children: [
            Text(
              "TScore",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.black87,
              ),
            ),
            Text(
              "Sign in to access your account",
              textAlign: TextAlign.center,
              style: Get.textTheme.labelMedium,
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Password"),
                TextButton(
                  onPressed: () => Get.to(
                    const ForgotPasswordView(),
                  ),
                  child: Text(
                    "Forgot Password",
                    style: Get.textTheme.labelSmall,
                  ),
                )
              ],
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                labelStyle: Get.textTheme.bodySmall,
                hintText: "********",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FastButton(
              label: "Sign in",
              background: Colors.blue,
              onPressed: () {
                context.showMessage(
                  "This is just a message",
                  position: MessagePosition.bottom,
                );
                Get.to(const RegisterView());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Don't have an account yet ? ",
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(const RegisterView()),
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
