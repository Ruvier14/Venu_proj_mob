import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_assets.dart';
import '../../../models/venue.dart';

class VenueCard extends StatefulWidget {
  final Venue venue;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onFavoriteChanged;

  const VenueCard({
    super.key,
    required this.venue,
    this.onTap,
    this.onFavoriteChanged,
  });

  @override
  State<VenueCard> createState() => _VenueCardState();
}

class _VenueCardState extends State<VenueCard> {
  late bool _isFavorite;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.venue.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            const SizedBox(height: 8),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.surfaceVariant,
          ),
          clipBehavior: Clip.antiAlias,
          child: widget.venue.images.isEmpty
              ? _buildPlaceholderImage()
              : PageView.builder(
                  itemCount: widget.venue.images.length,
                  onPageChanged: (index) {
                    setState(() => _currentImageIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.venue.images[index],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildPlaceholderImage(),
                    );
                  },
                ),
        ),
        // Status badge
        if (widget.venue.status != null)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.statusInReview,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.venue.status!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),
            ),
          ),
        // Favorite button
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              setState(() => _isFavorite = !_isFavorite);
              widget.onFavoriteChanged?.call(_isFavorite);
            },
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? AppColors.heartActive : Colors.white,
              size: 24,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),
        // Page indicator dots
        if (widget.venue.images.length > 1)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.venue.images.length.clamp(0, 5),
                (index) => Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppColors.surfaceVariant,
      child: Center(
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            AppAssets.userImage,
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.venue.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Urbanist',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.star, size: 14, color: AppColors.ratingstar),
              const SizedBox(width: 2),
              Text(
                widget.venue.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            widget.venue.city,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '₱${_formatPrice(widget.venue.price)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const TextSpan(
                  text: ' per event',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double price) {
    if (price >= 1000) {
      return price.toStringAsFixed(0).replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    }
    return price.toStringAsFixed(0);
  }
}
