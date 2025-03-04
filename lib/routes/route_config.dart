import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urbex_pro/routes/route_const.dart';
import 'package:urbex_pro/screens/addHouse.dart';
import 'package:urbex_pro/screens/addProductStep1.dart';
import 'package:urbex_pro/screens/agentImmoHome.dart';
import 'package:urbex_pro/screens/chooseProfileScreen.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/screens/onboardingScreen.dart';
import 'package:urbex_pro/screens/otpCodeScreen.dart';
import 'package:urbex_pro/screens/userProfileScreen.dart';
import 'package:urbex_pro/screens/walletScreen.dart';

import '../screens/register/registerAgentScreen.dart';

/*class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: MyAppRouteConstants.onboardingRouteName,
      path: '/onboarding',
      pageBuilder: (context, state) {
        return MaterialPage(child: OnboardingScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.homeRouteName,
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: AgentImmoHomeScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.chooseProfileRouteName,
      path: '/chooseProfile',
      pageBuilder: (context, state) {
        return MaterialPage(child: ChooseProfileScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.registerAgentRouteName,
      path: '/registerAgent',
      pageBuilder: (context, state) {
        return MaterialPage(child: RegisterAgentScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.loginRouteName,
      path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.otpCodeRouteName,
      path: '/otpCode',
      pageBuilder: (context, state) {
        return MaterialPage(child: OtpCodeScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.addHouseRouteName,
      path: '/addHouse',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddHouse());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.addProductRouteName,
      path: '/addProduct',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddProductStep1());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.userProfileRouteName,
      path: '/userProfile',
      pageBuilder: (context, state) {
        return MaterialPage(child: UserProfileScreen());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.walletRouteName,
      path: '/wallet',
      pageBuilder: (context, state) {
        return MaterialPage(child: WalletScreen());
      },
    ),
  ]);
}
*/