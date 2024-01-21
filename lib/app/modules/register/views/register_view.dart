import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/data/components/Header.dart';
import 'package:tscore_app/app/data/components/TextInputForm.dart';
import 'package:tscore_app/app/data/components/TextRowBtn.dart';
import 'package:tscore_app/app/data/const/components.dart';
import 'package:tscore_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:tscore_app/app/modules/login/views/login_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formState,
          child: FastContent(
            children: <Widget>[
              spaceH_5,
              const Header(
                subtitle: "Create account",
              ),
              spaceH_5,
              TextInputForm(
                hint: "Firstname",
                head: "Firstname",
                borderRadius: BorderRadius.circular(10),
                controller: controller.firstname,
                validator: (s) => GetUtils.isNull(s)
                    ? "This field is required"
                    : GetUtils.isLengthLessThan(s, 3)
                        ? "Too Short"
                        : null,
              ),
              spaceH_5,
              TextInputForm(
                hint: "Lastname",
                head: "Lastname",
                borderRadius: BorderRadius.circular(10),
                controller: controller.lastname,
                validator: (s) => GetUtils.isNull(s)
                    ? "This field is required"
                    : GetUtils.isLengthLessThan(s, 3)
                        ? "Too Short"
                        : null,
              ),
              spaceH_5,
              TextInputForm(
                hint: "email@email.com",
                head: "Email",
                borderRadius: BorderRadius.circular(10),
                controller: controller.email,
                validator: (s) =>
                    GetUtils.isEmail(s!) ? null : "Email is invalid",
              ),
              spaceH_5,
              TextInputForm(
                isPassword: true,
                hint: "********",
                head: "Password",
                borderRadius: BorderRadius.circular(10),
                controller: controller.password,
                validator: (s) => GetUtils.isNull(s)
                    ? "This field is required"
                    : GetUtils.isLengthLessThan(s, 6)
                        ? "Too Short"
                        : null,
              ),
              spaceH_5,
              TextInputForm(
                isPassword: true,
                hint: "********",
                head: "Confirm Password",
                borderRadius: BorderRadius.circular(10),
                validator: (s) => GetUtils.hasMatch(s, controller.password.text)
                    ? null
                    : "Password doesn't match",
                controller: controller.confirmPassword,
              ),
              spaceH_5,
              Obx(() {
                return FastButton(
                  label: controller.isLoading.value ? "Loading..." : "Sign Up",
                  background: Colors.blue,
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.validateData(context),
                );
              }),
              TextButton(
                onPressed: () => Get.to(const ForgotPasswordView()),
                child: const Text("Forgot Password?"),
              ),
              TextRowBtn(
                firstText: "Already have an account? ",
                endText: "Login",
                onPressed: () => Get.to(const LoginView()),
              ),
              spaceH_10,
            ],
          ),
        ),
      ),
    );
  }
}
