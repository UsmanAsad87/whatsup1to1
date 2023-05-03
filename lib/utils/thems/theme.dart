
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsup1to1/common/common_libs.dart';

import 'my_colors.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: MyColors.themeColor,
    scaffoldBackgroundColor: MyColors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: MyColors.contentColor),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: MyColors.contentColor),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => MyColors.themeColor),
      overlayColor:  MaterialStateColor.resolveWith((states) => MyColors.titleColor),
    ),

    colorScheme: const ColorScheme.light(
      secondary: MyColors.titleColor,
      tertiary:  MyColors.contentColor,
      secondaryContainer:  MyColors.borderColor,
      tertiaryContainer: MyColors.greyLight,
      primary:  MyColors.primaryLight,
      error: MyColors.errorColor,
      onBackground: MyColors.white
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1.h,
      backgroundColor: Colors.white,
      selectedItemColor: MyColors.themeColor,
      unselectedItemColor: MyColors.titleColor,
      selectedIconTheme: const IconThemeData(color: MyColors.themeColor),
      showUnselectedLabels: true,
    ),
  );
}
//
// ThemeData darkThemeData(BuildContext context) {
//   // Bydefault flutter provie us light and dark theme
//   // we just modify it as our need
//   return ThemeData.dark().copyWith(
//     primaryColor: Pallete.kPrimaryColor,
//     scaffoldBackgroundColor: Pallete.kContentColorLightTheme,
//     appBarTheme: appBarTheme,
//     iconTheme: const IconThemeData(color: Pallete.kContentColorDarkTheme),
//     textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
//         .apply(bodyColor: Pallete.kContentColorDarkTheme),
//     colorScheme: const ColorScheme.dark().copyWith(
//       primary: Pallete.kPrimaryColor,
//       onPrimary: Pallete.kWhiteColor,
//       onSecondary: Pallete.kOnSecondaryColor,
//       secondary: Pallete.kSecondaryColor,
//       error: Pallete.kErrorColor,
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: Pallete.kContentColorLightTheme,
//       selectedItemColor: Colors.white70,
//       unselectedItemColor: Pallete.kContentColorDarkTheme.withOpacity(0.32),
//       selectedIconTheme: const IconThemeData(color: Pallete.kPrimaryColor),
//       showUnselectedLabels: true,
//     ),
//   );
// }

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0, color: MyColors.themeColor);
