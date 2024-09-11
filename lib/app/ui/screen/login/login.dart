import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/login_elevated_button.dart';
import 'package:power_bank/app/ui/widget/login_text_field.dart';
import 'package:power_bank/resources/app_router_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = false;
  void _showPassword() {
    obscure = !obscure;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            const Text(
              'Welcome Back!',
              style: TextStyles.s28w600white,
            ),
            const SizedBox(height: 12),
            const Text(
              'Please sign in your account',
              style: TextStyles.s16w400white,
            ),
            const SizedBox(height: 48),
            LoginTextField(
              hintText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone_rounded),
            ),
            const SizedBox(height: 12),
            LoginTextField(
              prefixIcon: const Icon(Icons.password_outlined),
              obscureText: obscure,
              hintText: 'Password',
              suffixIcon: GestureDetector(
                  onTap: _showPassword,
                  child: Icon(obscure
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined)),
            ),
            const Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?  ',
                  style: TextStyles.s14w400white,
                  children: [
                    TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: AppColors.deepBlue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(MyAppRouteConstants.signup);
                          }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            LoginElevatedButton(
              title: 'ism'.tr(),
              onTap: () {
                context.goNamed(MyAppRouteConstants.mapscreen);
              },
            ),
            const SizedBox(height: 24),
            const Text('dadsadsadsadsadsadsadsdsadasdadadad',style: TextStyles.s16w400white,)
          ],
        ),
      ),
    );
  }
}
