import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tscore_app/app/data/const/components.dart';

import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    var controller = Get.put(SubscriptionController());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.checkUser,
          child: FastContent(
            children: [
              spaceH_10,
              Text(
                "TScore Subscription",
                style: Get.textTheme.headlineMedium!.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Unlock the Action: Your All-Access Pass to Thrilling Live Sports with Our Exclusive Single Subscription Plan!",
                style: Get.textTheme.labelMedium,
              ),
              spaceH_10,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black87,
                  ),
                ),
                child: FastColumn(
                  children: [
                    Text(
                      "Unlimited Access",
                      style: Get.textTheme.headlineMedium,
                    ),
                    Text(
                      "Get ready for an unparalleled sports streaming experience. You can subscribe using your subscription number ",
                      style: Get.textTheme.labelSmall,
                    ),
                    Text(
                      "What’s included",
                      style: Get.textTheme.labelMedium!.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                    const FastRow(
                      children: [
                        Icon(
                          FontAwesome.check_solid,
                          color: Colors.blue,
                        ),
                        Text(" Exclusive Game Access "),
                      ],
                    ),
                    const FastRow(
                      children: [
                        Icon(
                          FontAwesome.check_solid,
                          color: Colors.blue,
                        ),
                        Text(" On-Demand Replays "),
                      ],
                    ),
                    const FastRow(
                      children: [
                        Icon(
                          FontAwesome.check_solid,
                          color: Colors.blue,
                        ),
                        Text(" HD Quality Streaming "),
                      ],
                    ),
                    const FastRow(
                      children: [
                        Icon(
                          FontAwesome.check_solid,
                          color: Colors.blue,
                        ),
                        Text(" Ad-Free Experience "),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FastColumn(
                        cross: CrossAxisAlignment.center,
                        children: [
                          spaceH_10,
                          FastDropDown<Subscription>(
                            items: controller.SubscriptionData.map((e) => e)
                                .toList(),
                            // value: '1',
                            clearButton: const SizedBox(),
                            value: controller.SubscriptionData[0],
                            onChanged: (val) =>
                                controller.sub.value = val!.label,
                            itemBuilder: (v) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      v.name,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              text: "₦1,500",
                              style: Get.textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "per month",
                                  style: Get.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          FastButton(
                            label: "Get Started",
                            onPressed: () => controller.paySub(context),
                            background: Colors.blue,
                          ),
                          Text(
                            "Cancel anytime. No hidden fees.",
                            style: Get.textTheme.bodySmall,
                          ),
                          spaceH_5,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
