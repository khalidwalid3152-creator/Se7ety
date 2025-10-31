import 'package:flutter/material.dart';
import 'package:se7ety/core/images/images.dart';
import 'package:se7ety/core/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(flex: 1),
                Text(
                  "اهلا بيك",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  "سجل و احجز عند دكتورك و انت في البيت",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.borderColor,
                  ),
                ),
                Spacer(flex: 2),
                Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withAlpha(128),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,0),
                    child: Column(
                      children: [
                        Spacer(flex: 1),
                        Text(
                          "سجل دلوقتي كـ",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.cardColor,
                          ),
                        ),
                        Spacer(flex: 3),
                        SizedBox(
                          width: double.infinity,
                          height: 70,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(25),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "دكتور",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        SizedBox(
                          width: double.infinity,
                          height: 70,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(25),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "مريض",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
