import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class MyDrawerTile extends StatelessWidget {
  final String image;
  final String text;
  final Widget screen;
  const MyDrawerTile({
    super.key,
    required this.image,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            SvgPicture.asset(
              color: AppColors.white,
              'assets/vectors/$image.svg',
              width: 22,
              height: 22,
            ),
            SizedBox(width: 12),
            Text(text,style: TextStyles.s18w500white,),
          ],
        ),
      ),
    );
  }
}
