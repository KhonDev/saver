import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                const Text(
                  'Bog\'lanish',
                  style: TextStyles.s28w600white,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              child: SvgPicture.asset(
                'assets/vectors/collab.svg',
                color: AppColors.deepBlue,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.white,
                  )),
              child: const Row(
                children: [
                  Icon(
                    Icons.telegram,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Telegram',
                    style: TextStyles.s24w600white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.white)),
              child: Row(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/vectors/call.svg',
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Telefon',
                    style: TextStyles.s24w600white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
