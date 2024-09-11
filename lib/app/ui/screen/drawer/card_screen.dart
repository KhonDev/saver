import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:power_bank/app/ui/screen/drawer/card_add_screen.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/card_item.dart';
import 'package:power_bank/resources/app_router_constants.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/vectors/back.svg',
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Bank Kartalari',
                    style: TextStyles.s28w600white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const CardTile(),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardAddScreen(),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: SvgPicture.asset(
                        'assets/vectors/cardadd.svg',
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Karta qoshish ',
                      style: TextStyles.s18w500white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
