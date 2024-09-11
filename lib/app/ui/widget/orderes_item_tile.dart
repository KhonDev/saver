import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/screen/drawer/orders_item_screen.dart';

class OrdersItemTile extends StatelessWidget {
  const OrdersItemTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrderItemScreen(),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 16, 0),
                  child: Icon(
                    Icons.energy_savings_leaf_sharp,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '22.09.2024 10:19',
                      style: TextStyles.s20w500white,
                    ),
                    Text(
                      '281-48',
                      style: TextStyles.s14w400grey,
                    ),
                    Text(
                      'Duration: 01:12:23',
                      style: TextStyles.s14w400grey,
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  '0.3\$',
                  style: TextStyles.s20w500white,
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  'assets/vectors/arrowright.svg',
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
