import 'package:clean_architecture_demo/presentation/color_manager.dart';
import 'package:clean_architecture_demo/presentation/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors

      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary ,  // ripple effect color

      //card view theme
      cardTheme: CardTheme(
        color: ColorManager.white,
      shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      )

      // appbar theme

      //button theme

      //text theme

      //input decoration theme (text form field)
      );
}
