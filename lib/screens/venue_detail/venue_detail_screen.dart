import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_assets.dart';
import '../../models/venue.dart';
import 'widgets/photo_gallery_sheet.dart';
import 'widgets/host_info_widget.dart';
import 'widgets/amenities_widget.dart';
import 'widgets/reviews_widget.dart';
import 'widgets/house_rules_widget.dart';
import 'widgets/booking_bottom_bar.dart';
import 'widgets/share_bottom_sheet.dart';

class VenueDetailScreen extends StatefulWidget {
  final Venue venue;

  const VenueDetailScreen({super.key, required this.venue});

  @override
  State<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends State<VenueDetailScreen> {
  late bool _isSaved;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.venue.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          _buildImageGallery(context),
          SliverToBoxAdapter(child: _buildVenueHeader()),
          SliverToBoxAdapter(child: _buildDivider()),
          SliverToBoxAdapter(child: _buildVenueTypeAndCity()),
          SliverToBoxAdapter(child: _buildDivider()),
          SliverToBoxAdapter(
            child: HostInfoWidget(
              hostName: widget.venue.hostName,
              hostImage: widget.venue.hostImage,
              daysHosting: widget.venue.hostDaysHosting,
              communicationRating: widget.venue.communicationRating,
              easeOfCheckIn: widget.venue.easeOfCheckIn,
              cancellationRate: widget.venue.cancellationRate,
            ),
          ),
          SliverToBoxAdapter(child: _buildDivider()),
          SliverToBoxAdapter(
            child: AmenitiesWidget(amenities: widget.venue.amenities),
          ),
          SliverToBoxAdapter(child: _buildDivider()),
          SliverToBoxAdapter(child: _buildAboutSection()),
          if (widget.venue.houseRules != null) ...[
            SliverToBoxAdapter(child: _buildDivider()),
            SliverToBoxAdapter(
              child: HouseRulesWidget(rules: widget.venue.houseRules!),
            ),
          ],
          if (widget.venue.reviews.isNotEmpty) ...[
            SliverToBoxAdapter(child: _buildDivider()),
            SliverToBoxAdapter(
              child: ReviewsWidget(
                reviews: widget.venue.reviews,
                overallRating: widget.venue.rating,
                reviewCount: widget.venue.reviewCount,
              ),
            ),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: BookingBottomBar(
        price: widget.venue.price,
        onReserve: () {},
      ),
    );
  }

  Widget _buildImageGallery(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: AppColors.surface,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 20),
            color: AppColors.textPrimary,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.surface,
          child: IconButton(
            icon: const Icon(Icons.share_outlined, size: 20),
            color: AppColors.textPrimary,
            onPressed: () => _showShareSheet(context),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: AppColors.surface,
          child: IconButton(
            icon: Icon(
              _isSaved ? Icons.favorite : Icons.favorite_border,
              size: 20,
            ),
            color: _isSaved ? AppColors.heartActive : AppColors.textPrimary,
            onPressed: () {
              setState(() => _isSaved = !_isSaved);
            },
          ),
        ),
        const SizedBox(width: 16),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            widget.venue.images.isEmpty
                ? _buildPlaceholderGallery()
                : PageView.builder(
                    itemCount: widget.venue.images.length,
                    onPageChanged: (i) =>
                        setState(() => _currentImageIndex = i),
                    itemBuilder: (_, i) => Image.network(
                      widget.venue.images[i],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          _buildPlaceholderGallery(),
                    ),
                  ),
            // Show all photos button
            Positioned(
              bottom: 16,
              right: 16,
              child: GestureDetector(
                onTap: () => _showPhotoGallery(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.textPrimary),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.grid_view_rounded,
                          size: 16, color: AppColors.textPrimary),
                      const SizedBox(width: 6),
                      Text(
                        'Show all photos',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Page indicator
            if (widget.venue.images.length > 1)
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.venue.images.length.clamp(0, 5),
                    (i) => Container(
                      width: 7,
                      height: 7,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImageIndex == i
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderGallery() {
    return Container(
      color: AppColors.surfaceVariant,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(AppAssets.userImage, width: 80, height: 80),
            ),
            const SizedBox(height: 8),
            Text(
              'No photos yet',
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 14,
                fontFamily: 'Urbanist',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVenueHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        widget.venue.name,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          fontFamily: 'Urbanist',
        ),
      ),
    );
  }

  Widget _buildVenueTypeAndCity() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.venue.venueType} in ${widget.venue.city}',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _buildFeatures(),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontFamily: 'Urbanist',
            ),
          ),
        ],
      ),
    );
  }

  String _buildFeatures() {
    final features = <String>[];
    features.add('Up to ${widget.venue.maxGuests} guests');
    if (widget.venue.amenities.isNotEmpty) {
      features.add(widget.venue.amenities.take(3).join(' · '));
    }
    return features.join(' · ');
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About this place',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.venue.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          if (widget.venue.description.length > 200)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Show more >',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.borderLight,
      indent: 20,
      endIndent: 20,
    );
  }

  void _showShareSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ShareBottomSheet(venue: widget.venue),
    );
  }

  void _showPhotoGallery(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => PhotoGallerySheet(venue: widget.venue),
    );
  }
}
