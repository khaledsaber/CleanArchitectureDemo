import 'package:clean_architecture_demo/presentation/color_manager.dart';
import 'package:clean_architecture_demo/presentation/fonts_manager.dart';
import 'package:clean_architecture_demo/presentation/styles_manager.dart';
import 'package:clean_architecture_demo/presentation/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors

      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
      // ripple effect color

      //card view theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),

      // appbar theme

      appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
      ),

      //button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary,
      ),

      //elevated button theme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          textStyle: getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s17,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      ),

      //text theme
      textTheme: TextTheme(
        headlineLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s16,
        ),
        titleMedium: getMediumStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSize.s14,
        ),
        bodySmall: getRegularStyle(color: ColorManager.grey1),
        bodyMedium: getRegularStyle(
          color: ColorManager.grey,
        ),
      )

      //input decoration theme (text form field)
      );
}
