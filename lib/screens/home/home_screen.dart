import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_assets.dart';
import '../../data/sample_venues.dart';
import '../../models/venue.dart';
import '../venue_detail/venue_detail_screen.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/venue_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = SampleVenues.getAllSections();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(child: _buildHeroSection()),
          SliverToBoxAdapter(child: const SizedBox(height: 8)),
          SliverToBoxAdapter(child: VenueSearchBar(onTap: () {})),
          SliverToBoxAdapter(child: const SizedBox(height: 32)),
          ...sections.map(
            (section) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: VenueSectionWidget(
                  section: section,
                  onVenueTap: (venue) => _navigateToDetail(context, venue),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 60,
      title: Row(
        children: [
          Image.asset(
            AppAssets.userImage,
            width: 36,
            height: 36,
          ),
          const SizedBox(width: 8),
          Text(
            'venu',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Urbanist',
            ),
          ),
          Text(
            ' PH',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              fontFamily: 'Urbanist',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign in',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
        ),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(
                Icons.menu,
                size: 20,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      color: AppColors.surface,
      child: Column(
        children: [
          // Events tab
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.celebration_outlined,
                  size: 18,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  'EVENTS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: 1.2,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Plan less, celebrate more',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Venue venue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VenueDetailScreen(venue: venue),
      ),
    );
  }
}
