import 'package:flutter/material.dart';
import 'package:health_app/onboarding/intro_custom_widget/intro_custom_button.dart';
import 'package:health_app/onboarding/intro_screens/intro_pageOne.dart';
import 'package:health_app/onboarding/intro_screens/intro_pagethree.dart';
import 'package:health_app/onboarding/intro_screens/intro_pagetwo.dart';
import 'package:health_app/screen_routes/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2); // Last page
              });
            },
            children: const [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),

          // Bottom Navigations
          Container(
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Back Button (only visible if not on the first page)
                if (!onLastPage) // If we're not on the last page, show the back button
                  IntroCustomButton(
                    textTitle: 'Back',
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),

                // Page Indicator (only show if not on last page)
                if (!onLastPage)
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect:
                        const SlideEffect(activeDotColor: Color(0xFF4CAF50)),
                  ),

                // Next or Get Started Button
                IntroCustomButton(
                  textTitle: onLastPage ? 'Get Started' : 'Next',
                  onPressed: () {
                    if (onLastPage) {
                      // Go to HomeScreen on clicking the Next button
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    } else {
                      // Go to the next page
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
