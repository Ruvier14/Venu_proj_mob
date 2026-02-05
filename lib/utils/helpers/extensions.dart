import 'package:flutter/material.dart';

/// Extension methods for BuildContext
extension ContextExtensions on BuildContext {
  /// Get screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Get theme
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Check if dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Get padding from safe area
  EdgeInsets get safePadding => MediaQuery.paddingOf(this);

  /// Get keyboard height
  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;

  /// Hide keyboard
  void hideKeyboard() => FocusScope.of(this).unfocus();

  /// Show snackbar
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), duration: duration, action: action),
    );
  }
}

/// Extension methods for double
extension DoubleExtensions on double {
  /// Convert to padding
  EdgeInsets get paddingAll => EdgeInsets.all(this);

  /// Convert to horizontal padding
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: this);

  /// Convert to vertical padding
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: this);

  /// Convert to margin all
  EdgeInsets get marginAll => EdgeInsets.all(this);

  /// Convert to horizontal margin
  EdgeInsets get marginHorizontal => EdgeInsets.symmetric(horizontal: this);

  /// Convert to vertical margin
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: this);

  /// Convert to border radius
  BorderRadius get borderRadius => BorderRadius.circular(this);

  /// Convert to radius
  Radius get radius => Radius.circular(this);
}

/// Extension methods for int
extension IntExtensions on int {
  /// Convert to padding
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());

  /// Convert to horizontal padding
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Convert to vertical padding
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Convert to margin all
  EdgeInsets get marginAll => EdgeInsets.all(toDouble());

  /// Convert to horizontal margin
  EdgeInsets get marginHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Convert to vertical margin
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Convert to border radius
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  /// Convert to radius
  Radius get radius => Radius.circular(toDouble());

  /// Convert to duration in milliseconds
  Duration get milliseconds => Duration(milliseconds: this);

  /// Convert to duration in seconds
  Duration get seconds => Duration(seconds: this);

  /// Convert to duration in minutes
  Duration get minutes => Duration(minutes: this);
}

/// Extension methods for String
extension StringExtensions on String {
  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalize each word
  String get capitalizeWords {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if email is valid
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  /// Truncate string
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength) + suffix;
  }
}

/// Extension methods for Color
extension ColorExtensions on Color {
  /// Get hex code
  String get toHex {
    return '#${toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }

  /// Lighten color
  Color lighten([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Darken color
  Color darken([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
