import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_bank/app/ui/screen/drawer/card_add_screen.dart';
import 'package:power_bank/app/ui/screen/drawer/card_screen.dart';
import 'package:power_bank/app/ui/screen/drawer/contact_us.dart';
import 'package:power_bank/app/ui/screen/drawer/profile.dart';
import 'package:power_bank/app/ui/screen/drawer/orders.dart';
import 'package:power_bank/app/ui/theme/app_colors.dart';
import 'package:power_bank/app/ui/theme/text_styles.dart';
import 'package:power_bank/app/ui/widget/my_drawer_tile.dart';

class DrawerScreen extends StatelessWidget {
  final VoidCallback onPressed;
  const DrawerScreen({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(),
              _buildProfileTile(context),
              SizedBox(
                height: 24,
              ),
              _buildDrawerItem(
                  context, 'story', 'Rental history', const OrdersScreen(),
                  verticalPadding: 12.0),
              _buildDrawerItem(
                  context, 'card', 'Payment options', const CardScreen()),
              _buildDrawerItem(
                  context, 'call', 'Contact us', const ContactUsScreen(),
                  verticalPadding: 12.0),
              _buildLogoutTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          'assets/vectors/back.svg',
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget _buildProfileTile(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fredric', maxLines: 2, style: TextStyles.s28w600white),
              Text(
                '+998 90 000 0000',
                style: TextStyles.s18w500white,
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/vectors/arrowright.svg',
            color: AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String image, String text, Widget screen,
      {double verticalPadding = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: MyDrawerTile(
        image: image,
        text: text,
        screen: screen,
      ),
    );
  }

  Widget _buildLogoutTile() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(
            'assets/vectors/logout.svg',
            width: 22,
            height: 22,
            color: AppColors.deepBlue,
          ),
        ),
        const SizedBox(width: 12),
        const Text('Log out', style: TextStyles.s18w500blue),
      ],
    );
  }
}
