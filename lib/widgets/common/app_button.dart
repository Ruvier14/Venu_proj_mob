import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

/// Custom button widget for Venu
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isOutlined;
  final bool isText;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isOutlined = false,
    this.isText = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.leading,
    this.trailing,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isLoading || isDisabled || onPressed == null;

    Widget buildButton() {
      if (isText) {
        return _buildTextButton(isButtonDisabled);
      } else if (isOutlined) {
        return _buildOutlinedButton(isButtonDisabled);
      } else {
        return _buildElevatedButton(isButtonDisabled);
      }
    }

    return SizedBox(
      width: width,
      height: height ?? AppDimensions.buttonHeightM,
      child: buildButton(),
    );
  }

  Widget _buildElevatedButton(bool isDisabled) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: foregroundColor ?? AppColors.textOnPrimary,
        disabledBackgroundColor: AppColors.borderLight,
        disabledForegroundColor: AppColors.textTertiary,
        elevation: elevation ?? AppDimensions.elevationXS,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppDimensions.borderRadiusM,
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildOutlinedButton(bool isDisabled) {
    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor ?? AppColors.primary,
        disabledForegroundColor: AppColors.textTertiary,
        side: BorderSide(color: borderColor ?? AppColors.primary),
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppDimensions.borderRadiusM,
        ),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildTextButton(bool isDisabled) {
    return TextButton(
      onPressed: isDisabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor ?? AppColors.primary,
        disabledForegroundColor: AppColors.textTertiary,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppDimensions.borderRadiusM,
        ),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return const SizedBox(
        width: AppDimensions.iconM,
        height: AppDimensions.iconM,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.textOnPrimary),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: AppDimensions.spacingS),
        ],
        Text(text, style: textStyle),
        if (trailing != null) ...[
          const SizedBox(width: AppDimensions.spacingS),
          trailing!,
        ],
      ],
    );
  }
}
