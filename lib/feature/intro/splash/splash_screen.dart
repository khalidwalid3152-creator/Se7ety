import 'package:flutter/material.dart';
import 'package:se7ety/core/images/images.dart';
import 'package:se7ety/core/navigation/go_router.dart';
import 'package:se7ety/core/navigation/navigations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()   {
    super.initState();
     Future.delayed( Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigations.pushReplacement(context,AppRouter.onboarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.log ,width: 350,),
            
          ],
        ),
      ),
    );
  }
}
