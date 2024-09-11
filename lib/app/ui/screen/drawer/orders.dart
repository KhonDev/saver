import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/orderes_item_tile.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // GoRouter.of(context).pop();
                  },
                  child: SvgPicture.asset('assets/vectors/back.svg',
                      color: AppColors.white),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Buyurtmalar tarixi',
                  style: TextStyles.s28w600white,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'September',
                style: TextStyles.s24w600white,
              ),
            ),
            const OrdersItemTile(),
            const OrdersItemTile(),
            const OrdersItemTile(),
            const OrdersItemTile(),
            const OrdersItemTile(),
            const OrdersItemTile(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'August',
                style: TextStyles.s24w600white,
              ),
            ),
            const OrdersItemTile(),
            const OrdersItemTile(),
            const OrdersItemTile(),
          ],
        ),
      ),
    );
  }
}
