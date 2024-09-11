import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class InfoListTile extends StatelessWidget {
  final String number;
  bool color;
  InfoListTile({
    super.key,
    required this.color,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(color ? Icons.battery_charging_full_rounded : Icons.battery_0_bar,
            color: AppColors.deepBlue, size: 50),
        Text(number, style: TextStyles.s24w600white),
        const SizedBox(
          width: 12,
        ),
        const Text(
          'charges can\nbe taken',
          style: TextStyles.s14w400grey,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      ],
    );
  }
}
