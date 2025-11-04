import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:se7ety/core/images/images.dart';
import 'package:se7ety/core/navigation/go_router.dart';
import 'package:se7ety/core/navigation/navigations.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/styles.dart';
import 'package:se7ety/feature/auth/data/user_type.dart';
import 'package:se7ety/feature/auth/presentation/cubit/cubit_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.usertype});
  final UserType usertype;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String handleuserType() {
    return widget.usertype == UserType.doctor ? 'دكتور' : 'مريض';
  }

  bool _obscuretext = true;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CubitAuth>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Gap(40),
                  Image.asset(
                    AppImages.log,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                  ),
                  Gap(40),
                  Text(
                    "سجل دخول الان كـ ''${handleuserType()}''",
                    style: Styles.subheadingStyle,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: cubit.emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primaryColor.withAlpha(50),
                      hintText: 'khalid@gmail.com',
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: AppColors.primaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textAlign: TextAlign.end,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك ادخل الايميل";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(20),
                  TextFormField(
                    obscureText: _obscuretext,
                    keyboardType: TextInputType.emailAddress,
                    controller: cubit.passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primaryColor.withAlpha(50),
                      hintText: '********',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscuretext = !_obscuretext;
                          });
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textAlign: TextAlign.end,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك ادخل الباسورد";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(25),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.cardColor,
                      ),
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.register();
                        }
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: Styles.subheadingStyle.copyWith(
                          color: AppColors.cardColor,
                        ),
                      ),
                    ),
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لدي حساب؟",
                        style: Styles.subheadingStyle.copyWith(
                          fontSize: 16,
                          color: AppColors.borderColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigations.push(
                            context,
                            AppRouter.register,
                            extra: widget.usertype,
                          );
                        },
                        child: Text(
                          "سجل الان",
                          style: Styles.subheadingStyle.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
