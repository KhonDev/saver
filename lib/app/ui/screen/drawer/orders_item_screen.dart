import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/order_item_header.dart';
import 'package:power_bank/app/ui/widget/order_item_roe.dart';

class OrderItemScreen extends StatelessWidget {
  const OrderItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
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
                const Text('Buyurtma tarixi', style: TextStyles.s28w600white),
              ],
            ),
            const SizedBox(height: 20),
            DottedBorder(
              color: AppColors.white,
              borderType: BorderType.RRect,
              radius: const Radius.circular(24),
              dashPattern: [7, 5],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Change number', style: TextStyles.s24w600white),
                      Text('22-830', style: TextStyles.s24w600white),
                      Divider(),
                      OrderItemHeader(),
                      Divider(),
                      OrderItemHeader(),
                      Divider(),
                      OrderItemRow(
                          first: 'Start', second: '12.12.2024 12:09:20'),
                      OrderItemRow(
                          first: 'Finish', second: '12.12.2024 12:09:20'),
                      OrderItemRow(first: 'Duration', second: '12:09:20'),
                      OrderItemRow(
                          first: 'Card payment', second: '5555 ***********'),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('total', style: TextStyles.s18w500blue),
                            Text('5.4\$', style: TextStyles.s20w500blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
