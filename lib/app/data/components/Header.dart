import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header(
      {super.key,
      this.title = "TScore",
      this.subtitle = "Sign in to access your account"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Get.textTheme.labelMedium,
        ),
      ],
    );
  }
}
