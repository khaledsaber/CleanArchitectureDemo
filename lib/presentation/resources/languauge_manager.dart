import 'package:flutter/cupertino.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "ar";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    return switch (this) {
      LanguageType.ARABIC => ARABIC,
      LanguageType.ENGLISH => ENGLISH
      };
  }
}
