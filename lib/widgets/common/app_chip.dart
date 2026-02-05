import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

/// Custom chip widget for Venu
class AppChip extends StatelessWidget {
  final String label;
  final Widget? avatar;
  final Widget? deleteIcon;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? deleteIconColor;
  final BorderSide? side;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final TextStyle? labelStyle;
  final OutlinedBorder? shape;

  const AppChip({
    super.key,
    required this.label,
    this.avatar,
    this.deleteIcon,
    this.onDelete,
    this.onTap,
    this.backgroundColor,
    this.labelColor,
    this.deleteIconColor,
    this.side,
    this.padding,
    this.elevation,
    this.labelStyle,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final chip = Chip(
      label: Text(
        label,
        style:
            labelStyle ??
            const TextStyle(
              fontSize: AppDimensions.fontXS,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
      ),
      avatar: avatar,
      deleteIcon: deleteIcon,
      onDeleted: onDelete,
      backgroundColor: backgroundColor ?? AppColors.surfaceVariant,
      labelStyle: labelStyle?.copyWith(color: labelColor),
      deleteIconColor: deleteIconColor ?? AppColors.textSecondary,
      side: side,
      padding: padding,
      elevation: elevation ?? AppDimensions.elevationNone,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: AppDimensions.borderRadiusS),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: AppDimensions.borderRadiusS,
        child: chip,
      );
    }

    return chip;
  }
}

/// Status Chip for tasks
class StatusChip extends StatelessWidget {
  final String label;
  final AppChipStatus status;

  const StatusChip({super.key, required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case AppChipStatus.todo:
        backgroundColor = AppColors.surfaceVariant;
        textColor = AppColors.statusTodo;
        break;
      case AppChipStatus.inProgress:
        backgroundColor = AppColors.infoLight;
        textColor = AppColors.statusInProgress;
        break;
      case AppChipStatus.completed:
        backgroundColor = AppColors.successLight;
        textColor = AppColors.statusCompleted;
        break;
      case AppChipStatus.cancelled:
        backgroundColor = AppColors.errorLight;
        textColor = AppColors.statusCancelled;
        break;
    }

    return AppChip(
      label: label,
      backgroundColor: backgroundColor,
      labelColor: textColor,
      padding:
          AppDimensions.paddingHorizontalS +
          const EdgeInsets.symmetric(vertical: AppDimensions.paddingXS),
    );
  }
}

/// Priority Chip for tasks
class PriorityChip extends StatelessWidget {
  final String label;
  final AppChipPriority priority;

  const PriorityChip({super.key, required this.label, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (priority) {
      case AppChipPriority.high:
        backgroundColor = AppColors.errorLight;
        textColor = AppColors.priorityHigh;
        break;
      case AppChipPriority.medium:
        backgroundColor = AppColors.warningLight;
        textColor = AppColors.priorityMedium;
        break;
      case AppChipPriority.low:
        backgroundColor = AppColors.successLight;
        textColor = AppColors.priorityLow;
        break;
      case AppChipPriority.none:
        backgroundColor = AppColors.surfaceVariant;
        textColor = AppColors.priorityNone;
        break;
    }

    return AppChip(
      label: label,
      backgroundColor: backgroundColor,
      labelColor: textColor,
      padding:
          AppDimensions.paddingHorizontalS +
          const EdgeInsets.symmetric(vertical: AppDimensions.paddingXS),
    );
  }
}

/// Status enum for chips
enum AppChipStatus { todo, inProgress, completed, cancelled }

/// Priority enum for chips
enum AppChipPriority { high, medium, low, none }
