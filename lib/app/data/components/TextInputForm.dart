import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/data/const/components.dart';

class TextInputForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final CrossAxisAlignment? crossAxisAlignment;
  final String? head;
  final TextStyle? headStyle;

  const TextInputForm(
      {super.key,
      this.validator,
      this.controller,
      this.padding,
      this.isPassword,
      this.hint,
      this.prefix,
      this.borderRadius,
      this.suffix,
      this.crossAxisAlignment,
      this.head,
      this.headStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        head != null
            ? Text(
                head!,
                style: headStyle,
              )
            : const SizedBox(),
        spaceH_10,
        TextFormField(
          obscureText: isPassword ?? false,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.zero,
            ),
            focusedBorder: const OutlineInputBorder(),
            labelStyle: Get.textTheme.bodySmall,
            hintText: hint,
            contentPadding: padding,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
