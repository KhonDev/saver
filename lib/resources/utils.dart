import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._();

  static Future<void> openInstagramm() async {
    String instaUrl = 'https://www.instagram.com/zikrilloxon.x/';
    final Uri url = Uri.parse(instaUrl);
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // URL ochib bo'lmasa, foydalanuvchiga xabar berish
      print('Instagramni ochib bo\'lmadi.');
    }
  }

  static Future<void> openTelegramm() async {
    String telegramUrl = 'https://t.me/z1krilloxon';
    final Uri url = Uri.parse(telegramUrl);
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // URL ochib bo'lmasa, foydalanuvchiga xabar berish
      print('Telegramni ochib bo\'lmadi.');
    }
  }

  static Future<void> openTelephone() async {
    final Uri url = Uri(
      scheme: 'tel',
      path: "+998901505177",
    );
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Telefon raqamiga qo'ng'iroq qilishning imkoni bo'lmasa, foydalanuvchiga xabar berish
      print('Telefon qo\'ng\'iroqni amalga oshirib bo\'lmadi.');
    }
  }
}
