import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          padding: const EdgeInsets.all(24),
          width: 280,
          decoration: BoxDecoration(
              color: AppColors.pink, borderRadius: BorderRadius.circular(16)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                '****  ****  ****  8915',
                style: TextStyles.s18w500grey,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Karta egasi',
                    style: TextStyles.s14w400grey,
                  ),
                  Text(
                    'Muddati',
                    style: TextStyles.s14w400grey,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alisher Botirov',
                    style: TextStyles.s16w400black,
                  ),
                  Text(
                    '12.26',
                    style: TextStyles.s16w400black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 0.7,
        height: 160,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
