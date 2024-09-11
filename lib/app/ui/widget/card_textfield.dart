import 'package:flutter/material.dart';

import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

// ignore: must_be_immutable
class CardTextField extends StatelessWidget {
  final String label;
  final String hint;
  Widget prefix;
  CardTextField({
    super.key,
    required this.label,
    required this.prefix,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // ignore: prefer_const_constructors
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: prefix,
        ),

        filled: true,
        hintStyle: TextStyles.s16w400grey,
        labelStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontFamily: 'Roboto',
        ),
        fillColor: AppColors.black,
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      style: TextStyles.s18w500white,
    );
  }
}
