import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

// ignore: must_be_immutable
class LoginTextField extends StatelessWidget {
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  final String hintText;
  LoginTextField({
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintStyle: TextStyles.s14w400white,
        prefixIconColor: AppColors.white,
        suffixIconColor: AppColors.white,
        suffixIcon: suffixIcon ?? const SizedBox(),
        prefixIcon: prefixIcon ??  null,
        filled: true,
        fillColor: AppColors.black,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.pink),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
