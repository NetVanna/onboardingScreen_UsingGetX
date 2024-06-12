import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen/constants/images/images.dart';
import 'package:onboarding_screen/constants/text/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/onboarding_controller.dart';
import '../widget/onboarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updateCurrentIndex,
            children: const [
              onboarding_widget(
                image: onboarding1,
                title: title,
                subtitle: subTitle,
              ),
              onboarding_widget(
                image: onboarding2,
                title: title,
                subtitle: subTitle,
              ),
              onboarding_widget(
                image: onboarding3,
                title: title,
                subtitle: subTitle,
              )
            ],
          ),
          Positioned(
            top: 50,
            right: 10,
            child: TextButton(
              onPressed: () {
                OnBoardingController.instance.skipPage();
              },
              child: const Text("Skip"),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: SmoothPageIndicator(
              controller: OnBoardingController.instance.pageController,
              count: 3,
              effect: const ExpandingDotsEffect(dotHeight: 6),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: InkWell(
              onTap: (){
                OnBoardingController.instance.nextPage();
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: Colors.blue),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
