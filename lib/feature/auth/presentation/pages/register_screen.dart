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
import 'package:se7ety/feature/auth/presentation/cubit/cubit_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.usertype});
  final UserType usertype;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String handleuserType() {
    return widget.usertype == UserType.doctor ? 'دكتور' : 'مريض';
  }

  bool _obscuretext = true;
  var passContriller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CubitAuth>();
    return BlocListener<CubitAuth, CubitState>(
      listener: (context, state) {
        if (state is LoadingState) {
          // Show loading indicator
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        }
        if (state is SuccsessState) {
          // Hide loading indicator
          Navigator.of(context).pop();
          // Navigate to another screen or show success message
        }
        if (state is ErrorState) {
          // Hide loading indicator
          Navigator.of(context).pop();
          // Show error message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        body: Form(
          key: cubit.formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(40),
                    Image.asset(
                      AppImages.log,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                    ),
                    Gap(40),
                    Text(
                      "سجل حساب جديد كـ ''${handleuserType()}''",
                      style: Styles.subheadingStyle,
                    ),
                    Gap(20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: cubit.nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.primaryColor.withAlpha(50),
                        hintText: 'الاسم',
                        prefixIcon: Icon(
                          Icons.person,
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
                          return "من فضلك ادخل الاسم";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Gap(20),
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
                          bool vv = cubit.formKey.currentState!.validate();
                          if (vv) {
                            cubit.register();
                          }
                        },
                        child: Text(
                          "تسجيل حساب",
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
                          " لدي حساب؟",
                          style: Styles.subheadingStyle.copyWith(
                            fontSize: 16,
                            color: AppColors.borderColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigations.push(context, AppRouter.login);
                          },
                          child: Text(
                            "سجل دخول",
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
      ),
    );
  }
}
