import 'package:flutter/widgets.dart';

/// App Dimensions for Venu
class AppDimensions {
  AppDimensions._();

  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusFull = 999.0;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  static const double spacingXXXL = 64.0;

  // Padding
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;

  // Margins
  static const double marginXS = 4.0;
  static const double marginS = 8.0;
  static const double marginM = 16.0;
  static const double marginL = 24.0;
  static const double marginXL = 32.0;

  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 40.0;
  static const double iconXXL = 48.0;

  // Font Sizes
  static const double fontXXS = 10.0;
  static const double fontXS = 12.0;
  static const double fontS = 14.0;
  static const double fontM = 16.0;
  static const double fontL = 18.0;
  static const double fontXL = 20.0;
  static const double fontXXL = 24.0;
  static const double fontXXXL = 28.0;
  static const double fontDisplay = 32.0;
  static const double fontHuge = 40.0;

  // Line Heights
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;

  // Button Heights
  static const double buttonHeightS = 36.0;
  static const double buttonHeightM = 44.0;
  static const double buttonHeightL = 52.0;

  // Input Heights
  static const double inputHeightS = 40.0;
  static const double inputHeightM = 48.0;
  static const double inputHeightL = 56.0;

  // Card Elevation
  static const double elevationNone = 0.0;
  static const double elevationXS = 1.0;
  static const double elevationS = 2.0;
  static const double elevationM = 4.0;
  static const double elevationL = 8.0;
  static const double elevationXL = 12.0;

  // Stroke Width
  static const double strokeWidthThin = 1.0;
  static const double strokeWidthNormal = 2.0;
  static const double strokeWidthThick = 3.0;

  // Avatar Sizes
  static const double avatarXS = 24.0;
  static const double avatarS = 32.0;
  static const double avatarM = 40.0;
  static const double avatarL = 56.0;
  static const double avatarXL = 72.0;

  // Animation Durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // Screen Breakpoints
  static const double breakpointMobile = 600.0;
  static const double breakpointTablet = 900.0;
  static const double breakpointDesktop = 1200.0;

  // Max Widths
  static const double maxWidthMobile = 600.0;
  static const double maxWidthTablet = 900.0;
  static const double maxWidthDesktop = 1200.0;
  static const double maxWidthContent = 800.0;

  // Border Radius Helpers
  static BorderRadius borderRadiusXS = BorderRadius.circular(radiusXS);
  static BorderRadius borderRadiusS = BorderRadius.circular(radiusS);
  static BorderRadius borderRadiusM = BorderRadius.circular(radiusM);
  static BorderRadius borderRadiusL = BorderRadius.circular(radiusL);
  static BorderRadius borderRadiusXL = BorderRadius.circular(radiusXL);
  static BorderRadius borderRadiusXXL = BorderRadius.circular(radiusXXL);
  static BorderRadius borderRadiusFull = BorderRadius.circular(radiusFull);

  // Edge Insets Helpers
  static EdgeInsets paddingAllXS = EdgeInsets.all(paddingXS);
  static EdgeInsets paddingAllS = EdgeInsets.all(paddingS);
  static EdgeInsets paddingAllM = EdgeInsets.all(paddingM);
  static EdgeInsets paddingAllL = EdgeInsets.all(paddingL);
  static EdgeInsets paddingAllXL = EdgeInsets.all(paddingXL);

  static EdgeInsets marginAllXS = EdgeInsets.all(marginXS);
  static EdgeInsets marginAllS = EdgeInsets.all(marginS);
  static EdgeInsets marginAllM = EdgeInsets.all(marginM);
  static EdgeInsets marginAllL = EdgeInsets.all(marginL);
  static EdgeInsets marginAllXL = EdgeInsets.all(marginXL);

  static EdgeInsets paddingHorizontalS = EdgeInsets.symmetric(
    horizontal: paddingS,
  );
  static EdgeInsets paddingHorizontalM = EdgeInsets.symmetric(
    horizontal: paddingM,
  );
  static EdgeInsets paddingHorizontalL = EdgeInsets.symmetric(
    horizontal: paddingL,
  );

  static EdgeInsets paddingVerticalS = EdgeInsets.symmetric(vertical: paddingS);
  static EdgeInsets paddingVerticalM = EdgeInsets.symmetric(vertical: paddingM);
  static EdgeInsets paddingVerticalL = EdgeInsets.symmetric(vertical: paddingL);
}
