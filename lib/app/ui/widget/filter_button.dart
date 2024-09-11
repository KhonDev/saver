import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';

class MapFilterButton extends StatefulWidget {
  final String title;
  const MapFilterButton({
    super.key,
    required this.title,
  });

  @override
  State<MapFilterButton> createState() => _MapFilterButtonState();
}

class _MapFilterButtonState extends State<MapFilterButton> {
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tap = !tap;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: tap ? AppColors.deepBlue : AppColors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: tap ? AppColors.deepBlue : AppColors.grey),
        ),
        child: Text(
          widget.title,
          style: tap ? TextStyles.s18w500white : TextStyles.s18w500grey,
        ),
      ),
    );
  }
}
