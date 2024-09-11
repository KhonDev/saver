import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';

class MapCircleItemBack extends StatelessWidget {
  final Widget child;
  const MapCircleItemBack({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
        margin: const EdgeInsets.only(right: 14),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: child);
  }
}
