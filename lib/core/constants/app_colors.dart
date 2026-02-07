import 'package:flutter/material.dart';

/// App Colors for Venu - Event Venue Booking Platform
class AppColors {
  AppColors._();

  // Primary Colors - Venu Blue
  static const Color primary = Color(0xFF1A8FE3);
  static const Color primaryLight = Color(0xFF4DA9ED);
  static const Color primaryDark = Color(0xFF1272B8);
  static const Color primaryContainer = Color(0xFFE3F2FD);

  // Secondary Colors - Warm Coral for accents
  static const Color secondary = Color(0xFFFF5A5F);
  static const Color secondaryLight = Color(0xFFFF8A8E);
  static const Color secondaryDark = Color(0xFFE04347);
  static const Color secondaryContainer = Color(0xFFFFEBEE);

  // Accent Colors - Amber for badges/highlights
  static const Color accent = Color(0xFFF5A623);
  static const Color accentLight = Color(0xFFFCD34D);
  static const Color accentDark = Color(0xFFD97706);

  // Background Colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF3F4F6);
  static const Color surfaceDark = Color(0xFF1A1A2E);

  // Text Colors
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF717171);
  static const Color textTertiary = Color(0xFFB0B0B0);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnDark = Color(0xFFF9FAFB);

  // Border Colors
  static const Color border = Color(0xFFDDDDDD);
  static const Color borderLight = Color(0xFFEEEEEE);
  static const Color borderDark = Color(0xFF374151);

  // Status Colors
  static const Color success = Color(0xFF00A699);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color warning = Color(0xFFF5A623);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFFF5A5F);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color info = Color(0xFF1A8FE3);
  static const Color infoLight = Color(0xFFE3F2FD);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);

  // Venue Status Colors
  static const Color statusInReview = Color(0xFFF5A623);
  static const Color statusActive = Color(0xFF00A699);
  static const Color statusInactive = Color(0xFFB0B0B0);

  // Rating Colors
  static const Color ratingstar = Color(0xFFFFB400);

  // Heart/Favorite
  static const Color heartActive = Color(0xFFFF5A5F);
  static const Color heartInactive = Color(0xFFFFFFFF);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF1A8FE3),
    Color(0xFF4DA9ED),
  ];

  static const List<Color> darkGradient = [
    Color(0xFF1A1A2E),
    Color(0xFF16213E),
  ];
}
