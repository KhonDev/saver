import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:power_bank/app/ui/screen/drawer/card_add_screen.dart';
import 'package:power_bank/app/ui/screen/error_page.dart';
import 'package:power_bank/app/ui/screen/login/login.dart';
import 'package:power_bank/app/ui/screen/login/otp.dart';
import 'package:power_bank/app/ui/screen/login/sign_up.dart';
import 'package:power_bank/app/ui/screen/map/map_screen.dart';
import 'package:power_bank/app/ui/screen/drawer/orders.dart';
import 'package:power_bank/app/ui/screen/drawer/profile.dart';
import 'package:power_bank/resources/app_router_constants.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.login,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginScreen(),
          );
        },
      ),
     
      GoRoute(
        name: MyAppRouteConstants.mapscreen,
        path: '/map_screen',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MapScreen(),
          );
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.signup,
        path: '/sign_up',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignUpScreen(),
          );
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.otpscreen,
        path: '/otp_screen',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: OtpScreen(),
          );
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.profile,
        path: '/profile',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ProfileScreen(),
          );
        },
      ),
      

     
      GoRoute(
        name: MyAppRouteConstants.orders,
        path: '/orders',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: OrdersScreen(),
          );
        },
      ),
      
      GoRoute(
        name: MyAppRouteConstants.card,
        path: '/card',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: CardAddScreen(),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: ErrorPage(),
      );
    },
  );
}
