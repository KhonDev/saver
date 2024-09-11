import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/login_elevated_button.dart';
import 'package:power_bank/app/ui/widget/login_text_field.dart';
import 'package:power_bank/resources/app_router_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscure = false;
  void _showPassword() {
    obscure = !obscure;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const Text(
            'Saver',
            style: TextStyles.s20w500white,
          ),
          const SizedBox(width: 8),
          const Text(
            'Saver ga xush kelibsiz!',
            style: TextStyles.s24w600white,
          ),
          const SizedBox(width: 8),
          const Text(
            'O`zingizga qulay tilni tanlang',
            style: TextStyles.s16w400white,
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              const Spacer(),
              Container(
                width: 195,
                height: 89,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language),
                    Text(
                      'O`zbekcha',
                      style: TextStyles.s16w400white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 195,
                height: 89,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language),
                    Text(
                      'O`zbekcha',
                      style: TextStyles.s16w400white,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),

          const Spacer(),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'You are have an account?  ',
                style: TextStyles.s14w400grey,
                children: [
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: AppColors.deepBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.goNamed(MyAppRouteConstants.login);
                        }),
                ],
              ),
            ),
          ),
          // LoginElevatedButton(
          //   onTap: () {
          //     context.goNamed(MyAppRouteConstants.otpscreen);
          //   },
          //   title: 'Sign Up',
          // ),
        ],
      ),
    );
  }
}
