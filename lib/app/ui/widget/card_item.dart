import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';

class CardTile extends StatelessWidget {
  const CardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [Colors.blue.shade200, Colors.blue.shade400],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(103, 230, 230, 230)),
                child: const Icon(
                  Icons.sim_card_rounded,
                  color: AppColors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  '8600 ****',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(103, 245, 245, 245)),
                child: const Text(
                  'Asosiy',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                child: SvgPicture.asset(
                  'assets/vectors/settings.svg',
                  color: AppColors.white,
                ),
              )
            ],
          ),
          const Spacer(),
          const Text(
            'gacha amal qiladi',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12/09',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              Text(
                'Survivial',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
