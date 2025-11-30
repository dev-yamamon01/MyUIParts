import 'package:go_router/go_router.dart';
import 'presentation/views/home/home_screen.dart';
import 'main.dart';
import 'presentation/views/more/oss_license/oss_licenses_page.dart';
import 'presentation/views/more/terms_page.dart';
import 'presentation/views/more/contact_page.dart';
import 'presentation/views/qr_scan_screen.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const homeScreen = '/home-screen';
  static const qrScanScreen = '/qr-scan-screen';

  ///MorePage用ルーター
  static const ossLicenses ='/oss-licenses';
  static const terms ='/terms';
  static const plan ='/plan';
  static const contact ='/contact';
  static const account ='/account';
  static const usernameEdit ='/account/username-edit';
  static const mailAddressEdit ='/account/mail-address-edit';
  static const mailPasscodeInput ='/account/mail-address-edit/passcode';
  static const passwordChange ='/account/password-edit';
  static const accountDelete ='/account/account-delete';
}

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRoutes.homeScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      name: 'homeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.qrScanScreen,
      name: 'qrScanScreen',
      builder: (context, state) => const QrScanScreen(),
    ),
    GoRoute(
      path: AppRoutes.ossLicenses,
      name: 'ossLicenses',
      builder: (context, state) => const OssLicensesPage(),
    ),
    GoRoute(
      path: AppRoutes.terms,
      name: 'terms',
      builder: (context, state) => const TermsPage(),
    ),
    GoRoute(
      path: AppRoutes.contact,
      name: 'contact',
      builder: (context, state) => const ContactPage(url: 'https://com.example/app-contact-us/'),
    ),
  ],
);