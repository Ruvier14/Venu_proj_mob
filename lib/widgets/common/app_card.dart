import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

/// Custom card widget for Venu
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderSide? borderSide;
  final double? width;
  final double? height;
  final Clip clipBehavior;
  final BoxShape shape;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.onTap,
    this.onLongPress,
    this.borderSide,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: shape == BoxShape.rectangle
            ? (borderRadius ?? AppDimensions.borderRadiusM)
            : null,
        border: borderSide != null ? Border.fromBorderSide(borderSide!) : null,
        boxShadow: elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: elevation!,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
        shape: shape,
      ),
      clipBehavior: clipBehavior,
      child: padding != null ? Padding(padding: padding!, child: child) : child,
    );

    if (onTap != null || onLongPress != null) {
      return InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: borderRadius ?? AppDimensions.borderRadiusM,
        child: card,
      );
    }

    return card;
  }
}

/// App Card with header
class AppCardWithHeader extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderSide? borderSide;

  const AppCardWithHeader({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.onTap,
    this.onLongPress,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      margin: margin,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      onTap: onTap,
      onLongPress: onLongPress,
      borderSide: borderSide,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null ||
              titleWidget != null ||
              (actions?.isNotEmpty ?? false))
            _buildHeader(),
          Padding(padding: padding ?? AppDimensions.paddingAllM, child: child),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding:
          AppDimensions.paddingHorizontalM +
          const EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderLight)),
      ),
      child: Row(
        children: [
          Expanded(
            child:
                titleWidget ??
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: AppDimensions.fontL,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
          ),
          if (actions?.isNotEmpty ?? false) ...[
            const SizedBox(width: AppDimensions.spacingS),
            ...actions!,
          ],
        ],
      ),
    );
  }
}
