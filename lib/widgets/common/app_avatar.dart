import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

/// Custom avatar widget for Venu
class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final Widget? child;
  final double? size;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? borderSide;
  final VoidCallback? onTap;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.child,
    this.size,
    this.backgroundColor,
    this.textColor,
    this.borderSide,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = size ?? AppDimensions.avatarM;
    final borderRadius = BorderRadius.circular(avatarSize / 2);

    Widget avatar;

    if (imageUrl != null) {
      avatar = CircleAvatar(
        radius: avatarSize / 2,
        backgroundImage: NetworkImage(imageUrl!),
        backgroundColor: backgroundColor ?? AppColors.surfaceVariant,
      );
    } else if (name != null) {
      final initials = _getInitials(name!);
      avatar = CircleAvatar(
        radius: avatarSize / 2,
        backgroundColor: backgroundColor ?? _getBackgroundColor(initials),
        child: Text(
          initials,
          style: TextStyle(
            fontSize: avatarSize * 0.4,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.textOnPrimary,
          ),
        ),
      );
    } else if (child != null) {
      avatar = CircleAvatar(
        radius: avatarSize / 2,
        backgroundColor: backgroundColor ?? AppColors.surfaceVariant,
        child: child,
      );
    } else {
      avatar = CircleAvatar(
        radius: avatarSize / 2,
        backgroundColor: backgroundColor ?? AppColors.surfaceVariant,
        child: Icon(
          Icons.person,
          size: avatarSize * 0.5,
          color: textColor ?? AppColors.textTertiary,
        ),
      );
    }

    if (borderSide != null) {
      avatar = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(borderSide!),
        ),
        child: avatar,
      );
    }

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        customBorder: const CircleBorder(),
        child: avatar,
      );
    }

    return avatar;
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }
    return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
  }

  Color _getBackgroundColor(String initials) {
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.accent,
      AppColors.info,
      AppColors.success,
      AppColors.warning,
      AppColors.error,
    ];

    final index = initials.hashCode % colors.length;
    return colors[index.abs()];
  }
}

/// App Avatar Group
class AppAvatarGroup extends StatelessWidget {
  final List<String> imageUrls;
  final List<String>? names;
  final double? size;
  final int maxVisible;
  final Color? backgroundColor;
  final Color? textColor;
  final double spacing;

  const AppAvatarGroup({
    super.key,
    required this.imageUrls,
    this.names,
    this.size,
    this.maxVisible = 3,
    this.backgroundColor,
    this.textColor,
    this.spacing = AppDimensions.spacingXS,
  });

  @override
  Widget build(BuildContext context) {
    final visibleImages = imageUrls.take(maxVisible).toList();
    final remainingCount = imageUrls.length - maxVisible;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...visibleImages.asMap().entries.map((entry) {
          final index = entry.key;
          final imageUrl = entry.value;
          return Transform.translate(
            offset: Offset(-index * spacing, 0),
            child: AppAvatar(
              imageUrl: imageUrl,
              name: names != null && names!.length > index
                  ? names![index]
                  : null,
              size: size,
              backgroundColor: backgroundColor,
              textColor: textColor,
            ),
          );
        }),
        if (remainingCount > 0)
          Transform.translate(
            offset: Offset(-visibleImages.length * spacing, 0),
            child: AppAvatar(
              name: '+$remainingCount',
              size: size,
              backgroundColor: backgroundColor ?? AppColors.surfaceVariant,
              textColor: textColor ?? AppColors.textPrimary,
            ),
          ),
      ],
    );
  }
}
