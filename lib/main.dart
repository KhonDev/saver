import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:power_bank/app/ui/screen/login/otp.dart';
import 'package:power_bank/resources/app_router_date.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('uz', 'UZ'),
      saveLocale: true,
      supportedLocales: const [
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/l10n',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    // debugShowCheckedModeBanner: false,
    // localizationsDelegates: context.localizationDelegates,
    // supportedLocales: context.supportedLocales,
    // locale: context.locale,
    // home: const OtpScreen(),
    // Agar router kerak bo'lsa, shu qismni uncomment qiling
    // routerConfig: MyAppRouter().router,
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyAppRouter().router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // );
    );
  }
}
