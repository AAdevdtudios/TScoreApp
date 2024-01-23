import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tscore_app/app/Services/ApiService.dart';
import 'package:tscore_app/app/modules/home/views/home_view.dart';
import 'package:tscore_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionController extends GetxController {
  RxString sub = "silver".obs;
  // var publicKey = 'pk_test_f4fa7e3077c895f51c81318474d7b9f52b221f41';
  // final plugin = PaystackPayment();
  @override
  void onInit() async {
    await checkUser();
    super.onInit();
  }

  Future<void> checkUser() async {
    await ApiServices().getUser();
    if (box.read("is_subscribed")) {
      Get.offAll(HomeView());
    }
  }

  var SubscriptionData = <Subscription>[
    Subscription("silver", "1 month - Silver package"),
    Subscription("gold", "3 months - Gold package"),
    Subscription("premium", "6 months - premium package"),
    Subscription("diamond", "1 year - Diamond package"),
  ];
  paySub(BuildContext context) async {
    await ApiServices().SubscribeUser(
      {
        "planName": sub.value,
        "isMobile": true,
      },
    ).then((value) async {
      final Uri _url = Uri.parse(value);
      print(value);
      await _launchUrl(_url);
    }).catchError((e) => print(e));
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class Subscription {
  final String label;
  final String name;

  Subscription(this.label, this.name);
}
