import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

/// App Text Styles for Venu using Urbanist Font Family
class AppTextStyles {
  AppTextStyles._();

  // Font Family
  static const String fontFamily = 'Urbanist';

  // Display Styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontHuge,
    fontWeight: FontWeight.w700,
    height: AppDimensions.lineHeightTight,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontDisplay,
    fontWeight: FontWeight.w700,
    height: AppDimensions.lineHeightTight,
    letterSpacing: -0.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXXXL,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightTight,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Headline Styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXXL,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXL,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontL,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Title Styles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontL,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontM,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.15,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontM,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightRelaxed,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightRelaxed,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightRelaxed,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );

  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXXS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.5,
    color: AppColors.textTertiary,
  );

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontM,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.5,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.5,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.5,
    color: AppColors.textOnPrimary,
  );

  // Caption Styles
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.4,
    color: AppColors.textTertiary,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXXS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 1.5,
    color: AppColors.textTertiary,
  );

  // Custom Styles
  static const TextStyle link = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.25,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );

  static const TextStyle code = TextStyle(
    fontFamily: 'monospace',
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Error Styles
  static const TextStyle error = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.25,
    color: AppColors.error,
  );

  // Success Styles
  static const TextStyle success = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.25,
    color: AppColors.success,
  );

  // Warning Styles
  static const TextStyle warning = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w500,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.25,
    color: AppColors.warning,
  );

  // On Dark Background
  static const TextStyle onDarkLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontL,
    fontWeight: FontWeight.w600,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0,
    color: AppColors.textOnDark,
  );

  static const TextStyle onDarkMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontM,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.25,
    color: AppColors.textOnDark,
  );

  static const TextStyle onDarkSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontS,
    fontWeight: FontWeight.w400,
    height: AppDimensions.lineHeightNormal,
    letterSpacing: 0.25,
    color: AppColors.textOnDark,
  );
}
