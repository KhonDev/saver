import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/card_textfield.dart';
import 'package:power_bank/app/ui/widget/carousel_card_tile.dart';
import 'package:power_bank/app/ui/widget/login_elevated_button.dart';
import 'package:power_bank/app/ui/widget/login_text_field.dart';
import 'package:power_bank/resources/app_router_constants.dart';

class CardAddScreen extends StatelessWidget {
  const CardAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: ListView(
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
          const SizedBox(height: 24),
          const CarouselCard(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 35,
                ),
                const Text(
                  'Yangi karta bog\'lash',
                  style: TextStyles.s20w500white,
                ),
                const SizedBox(height: 18),
                CardTextField(
                  label: 'Karta raqam',
                  hint: '0000 0000 0000 0000',
                  prefix: SvgPicture.asset(
                    'assets/vectors/card.svg',
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 18),
                CardTextField(
                  label: 'MM/YY',
                  hint: '00/00',
                  prefix: SvgPicture.asset(
                    'assets/vectors/calendar.svg',
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 18),
                CardTextField(
                    prefix: const SizedBox(),
                    label: 'Karta nomi',
                    hint: 'Kartangizni nomini yozing'),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Transform.scale(
                      scale:
                          0.8, // Hajmini kichiklashtirish (1.0 - standart hajm)
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (bool newValue) {},
                        activeColor: AppColors
                            .deepBlue, // Yoqilgan holatda switchning rangi deepBlue bo'ladi
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      'Kartani asosiy qilish',
                      style: TextStyles.s14w400white,
                    )
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.white),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Kartani qo’shish',
                      style: TextStyles.s18w500white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                LoginElevatedButton(title: 'Saqlash', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
