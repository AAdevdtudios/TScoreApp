import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  final controller = WebViewController();
  @override
  void onInit() {
    // controller
    //   ..setJavaScriptMode(JavaScriptMode.disabled)
    //   ..loadRequest(Uri.parse(
    //       "https://www.scorebat.com/embed/?token=MTMyNDUyXzE3MDYwNDA5NDBfYmNmNDQwNGE0MjE5NGEyMjEyYTA1MGU0ZjEyYTU1MTJmYzUwM2ZkMw=="));
    super.onInit();
  }
}
