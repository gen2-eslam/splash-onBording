import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:splsh_and_onboarding/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: OnBoardingModel.onBoardingData.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          OnBoardingModel.onBoardingData[index].imagePath,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                OnBoardingModel.onBoardingData[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                OnBoardingModel
                                    .onBoardingData[index].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "SKIP",
                    
                    style: TextStyle(color: Colors.white),
                  ),
                  DotsIndicator(
                    dotsCount: OnBoardingModel.onBoardingData.length,
                    position: selectedIndex,
                    decorator: DotsDecorator(
                      color: Colors.grey.shade300,
                      activeColor: Colors.white,
                      
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (selectedIndex < 2) {
                          setState(() {
                            controller.animateToPage(selectedIndex + 1,
                                duration: const Duration(seconds: 2),
                                curve: Curves.bounceOut);
                            selectedIndex++;
                          });
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
