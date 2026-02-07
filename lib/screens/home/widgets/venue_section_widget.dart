import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/venue.dart';
import 'venue_card.dart';

class VenueSectionWidget extends StatelessWidget {
  final VenueSection section;
  final ValueChanged<Venue>? onVenueTap;

  const VenueSectionWidget({
    super.key,
    required this.section,
    this.onVenueTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    section.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: section.venues.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final venue = section.venues[index];
              return VenueCard(
                venue: venue,
                onTap: () => onVenueTap?.call(venue),
              );
            },
          ),
        ),
      ],
    );
  }
}
