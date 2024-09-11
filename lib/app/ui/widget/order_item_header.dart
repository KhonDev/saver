import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class OrderItemHeader extends StatelessWidget {
  const OrderItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      dense: true,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.energy_savings_leaf_outlined),
          Icon(Icons.arrow_downward_rounded, color: AppColors.grey, size: 18)
        ],
      ),
      title: Text(
        'Widok Tower',
        style: TextStyles.s18w500white,
      ),
      subtitle: Text(
        'Alaje 5/3',
        style: TextStyles.s18w500grey,
      ),
    );
  }
}
