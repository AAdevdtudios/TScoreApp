import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextRowBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? firstText;
  final String? endText;
  final List<InlineSpan>? children;
  const TextRowBtn(
      {Key? key, this.onPressed, this.firstText, this.endText, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: firstText ?? "Don't have an account yet? ",
        style: const TextStyle(
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: endText ?? "Sign Up",
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          ...?children
        ],
      ),
    );
  }
}
