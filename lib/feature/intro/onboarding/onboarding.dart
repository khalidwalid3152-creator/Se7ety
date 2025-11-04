import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/core/navigation/go_router.dart';
import 'package:se7ety/core/navigation/navigations.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/styles.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var pageController = PageController();
  int? index;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            if (index != onboaeding.length - 1)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "تخطي",
                  style: Styles.subheadingStyle.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Spacer(),
                        SvgPicture.asset(
                          onboaeding[index].image!,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                        ),
                        Spacer(),
                        Text(
                          "${onboaeding[index].title}",
                          style: Styles.subheadingStyle,
                        ),
                        Gap(20),
                        Text(
                          "${onboaeding[index].description}",
                          style: Styles.subheadingStyle.copyWith(
                            color: AppColors.borderColor,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(flex: 3),
                      ],
                    ),
                  );
                },
                itemCount: onboaeding.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: onboaeding.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.backgroundColor,
                      ),
                    ),
                    if (index == onboaeding.length - 1)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.cardColor,
                        ),
                        onPressed: () {
                          Navigations.pushReplacement(
                            context,
                            AppRouter.welcome,
                          );
                        },
                        child: Text(
                          "هيا بنا",
                          style: Styles.subheadingStyle.copyWith(
                            color: AppColors.accentfColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
