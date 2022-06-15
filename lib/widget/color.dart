import 'package:flutter/material.dart';

const kActiveIconColor = Color(0xFFE68342);
const kDateColor = Color(0xFFAAB8C2);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
const mystic = Color.fromRGBO(230, 236, 240, 1.0);
const kPrimaryColor = Color(0xFF366CF6);
const kSecondaryColor = Color(0xFFF5F6FC);
const kBgLightColor = Color(0xFFF2F4FC);
const kBgDarkColor = Color(0xFFEBEDFA);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kDefaultPadding = 20.0;
const background = Color(0xFF000000);
const blue = Color(0xFF1DA1F2);
const gray = Color(0xFFAAB8C2);
const lightGray = Color(0xFFE1E8ED);
const extraLightGray = Color(0xFFF5F8FA);
const white = Color(0xFFFFFFFF);
const primary = Color(0xFF094542);
const secondary = Color(0xFFEDE5CC);
const kTeamColor = Color(0xFF4A6572);
const kTextColor = Color(0xFF232F34);
const Color black = Color(0xFF000000);
const Color initial = Color.fromRGBO(23, 43, 77, 1.0);
const Color label = Color.fromRGBO(254, 36, 114, 1.0);
const Color info = Color.fromRGBO(17, 205, 239, 1.0);
const Color error = Color.fromRGBO(245, 54, 92, 1.0);
const Color success = Color.fromRGBO(45, 206, 137, 1.0);
const Color warning = Color.fromRGBO(251, 99, 64, 1.0);
const Color header = Color.fromRGBO(82, 95, 127, 1.0);
const Color bgColorScreen = Color.fromRGBO(248, 249, 254, 1.0);
const Color border = Color.fromRGBO(202, 209, 215, 1.0);
const Color inputSuccess = Color.fromRGBO(123, 222, 177, 1.0);
const Color inputError = Color.fromRGBO(252, 179, 164, 1.0);
const Color muted = Color.fromRGBO(136, 152, 170, 1.0);
const Color text = Color.fromRGBO(50, 50, 93, 1.0);
const Color softprime = Color(0xFF107873);

class AppColor {
  static Color primary = Color(0xFF094542);
  static Color primarySoft = Color(0xFF0B5551);
  static Color primaryExtraSoft = Color(0xFFEEF4F4);
  static Color secondary = Color(0xFFEDE5CC);
  static Color whiteSoft = Color(0xFFF8F8F8);
  static LinearGradient bottomShadow = LinearGradient(colors: [
    Color(0xFF107873).withOpacity(0.2),
    Color(0xFF107873).withOpacity(0)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}