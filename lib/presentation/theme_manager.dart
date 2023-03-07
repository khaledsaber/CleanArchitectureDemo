import 'package:clean_architecture_crash_project/presentation/font_manager.dart';
import 'package:clean_architecture_crash_project/presentation/styles_manager.dart';
import 'package:clean_architecture_crash_project/presentation/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.lightPrimary,
    //ripple effect , when pressing a button

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),
  );
}
