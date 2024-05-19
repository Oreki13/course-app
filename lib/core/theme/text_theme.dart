import 'package:course_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';

import 'app_pallete.dart';

class TextThemes {
  static TextTheme get textTheme {
    return const TextTheme(
      bodyLarge: AppTextStyles.bodyLg,
      bodyMedium: AppTextStyles.body,
      titleMedium: AppTextStyles.bodySm,
      titleSmall: AppTextStyles.bodyXs,
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineMedium: AppTextStyles.h4,
    );
  }

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppPallet.black),
      bodyMedium: AppTextStyles.body.copyWith(color: AppPallet.black),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppPallet.black),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppPallet.black),
      displayLarge: AppTextStyles.h1.copyWith(color: AppPallet.black),
      displayMedium: AppTextStyles.h2.copyWith(color: AppPallet.black),
      displaySmall: AppTextStyles.h3.copyWith(color: AppPallet.black),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppPallet.black),
    );
  }
}