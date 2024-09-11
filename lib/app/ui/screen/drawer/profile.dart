import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildLanguageTile(
      String asset, String title, Locale locale, BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.setLocale(locale),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.deepBlue),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(asset, width: 40, height: 40),
              const SizedBox(width: 8),
              Text(title, style: TextStyles.s24w600white),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/vectors/back.svg',
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Text('Profil', style: TextStyles.s28w600white),
              ],
            ),
            const CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'),
            ),
            const SizedBox(height: 12),
            const Text('Fredric', style: TextStyles.s28w600white),
            const Text('+998 90 000 00 00', style: TextStyles.s18w500blue),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Uzbekiston uchun
                  _buildLanguageTile(
                      'assets/images/uzb.png',
                      'Uzbek',
                      Locale('uz', 'UZ'), // Til kodi va davlat kodi
                      context),
                  const SizedBox(width: 12),
                  // Rossiya uchun
                  _buildLanguageTile(
                      'assets/images/russia.png',
                      'Rus',
                      Locale('ru', 'RU'), // Til kodi va davlat kodi
                      context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
