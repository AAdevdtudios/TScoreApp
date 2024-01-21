import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BackTab extends StatelessWidget {
  final String tabName;
  const BackTab({Key? key, required this.tabName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const BackButton(),
        GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Bootstrap.chevron_left,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          tabName,
          style: Get.textTheme.labelLarge,
        ),
      ],
    );
  }
}
