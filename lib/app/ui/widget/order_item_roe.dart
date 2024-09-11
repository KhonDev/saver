import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class OrderItemRow extends StatelessWidget {
  final String first;
  final String second;

  const OrderItemRow({
    required this.first,
    required this.second,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: TextStyles.s14w400grey,
          ),
          Text(
            second,
            style: TextStyles.s16w400white,
          ),
        ],
      ),
    );
  }
}
