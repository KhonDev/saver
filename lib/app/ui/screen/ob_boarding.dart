import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/screen/map/map_screen.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/login_elevated_button.dart';
import 'package:power_bank/app/ui/widget/on_board.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    super.key,
  });

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  int onLastPage = 0;
  List onBoardTile = [
    const onBoard(
      image: AssetImage(
        'assets/images/charging.webp',
      ),
      text: Text('Make Your Service\nManagement\nEasier',
          style: TextStyles.s28w600white),
      textSecond: 'Be aware of your spending on services and\nsubscriptions',
    ),
    const onBoard(
      image: AssetImage('assets/images/charging.webp'),
      text: Text('Don\'t let your money\ngo to no one knows\nwhere',
          style: TextStyles.s28w600white),
      textSecond:
          'Calculate your spending on services and\nsubscriptions months in advance',
    ),
    const onBoard(
      image: AssetImage('assets/images/charging.webp'),
      text: Text('Don\'t miss payments\nand keep your\nrecords',
          style: TextStyles.s28w600white),
      textSecond:
          'Don\'t be afraid to miss a charge, we will\nnotify you in advance',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, top: 56, bottom: 24),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 3,
                    color: AppColors.deepBlue,
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 3,
                      color: onLastPage >= 1
                          ? AppColors.deepBlue
                          : AppColors.grey),
                ),
                Expanded(
                  child: Container(
                      height: 3,
                      color:
                          onLastPage > 1 ? AppColors.deepBlue : AppColors.grey),
                ),
              ],
            ),
            PageView(
              controller: controller,
              onPageChanged: (index) {
                onLastPage = index;
                setState(() {});
              },
              children: List.generate(
                3,
                (index) => onBoardTile[index],
              ),
            ),
            Container(
                alignment: const Alignment(0, 1),
                child: onLastPage == 2  
                    ? LoginElevatedButton(
                        title: 'Start',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const MapScreen()),
                          );
                        })
                    : LoginElevatedButton(
                        title: 'Next',
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        })),
          ],
        ),
      ),
    );
  }
}
