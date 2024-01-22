import 'package:flutter/material.dart';
import 'package:prayv1_beta/presentation/home_container_screen/home_container_screen.dart';
import 'package:prayv1_beta/presentation/splash_screen/splash_screen.dart';
import 'package:prayv1_beta/presentation/splash_screenone_screen/splash_screenone_screen.dart';
import 'package:prayv1_beta/presentation/splash_screentwo_screen/splash_screentwo_screen.dart';
import 'package:prayv1_beta/presentation/login_screen/login_screen.dart';
import 'package:prayv1_beta/presentation/signup_screen/signup_screen.dart';
import 'package:prayv1_beta/presentation/isidata_screen/isidata_screen.dart';
import 'package:prayv1_beta/presentation/saldo_screen/saldo_screen.dart';
import 'package:prayv1_beta/presentation/history_screen/history_screen.dart';
import 'package:prayv1_beta/presentation/edit_profil_screen/edit_profil_screen.dart';
import 'package:prayv1_beta/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String splashScreen = '/splash_screen';

  static const String splashScreenoneScreen = '/splash_screenone_screen';

  static const String splashScreentwoScreen = '/splash_screentwo_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String isidataScreen = '/isidata_screen';

  static const String saldoScreen = '/saldo_screen';

  static const String historyScreen = '/history_screen';

  static const String editProfilScreen = '/edit_profil_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homeContainerScreen: HomeContainerScreen.builder,
        splashScreen: SplashScreen.builder,
        splashScreenoneScreen: SplashScreenoneScreen.builder,
        splashScreentwoScreen: SplashScreentwoScreen.builder,
        loginScreen: LoginScreen.builder,
        signupScreen: SignupScreen.builder,
        isidataScreen: IsidataScreen.builder,
        saldoScreen: SaldoScreen.builder,
        historyScreen: HistoryScreen.builder,
        editProfilScreen: EditProfilScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: HomeContainerScreen.builder
      };
}
