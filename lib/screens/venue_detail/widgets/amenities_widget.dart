import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AmenitiesWidget extends StatelessWidget {
  final List<String> amenities;

  const AmenitiesWidget({super.key, required this.amenities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What this place offers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 0,
            runSpacing: 12,
            children: amenities.map((amenity) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 40) / 2,
                child: Row(
                  children: [
                    Icon(
                      _getAmenityIcon(amenity),
                      size: 22,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        amenity,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          if (amenities.length > 6) ...[
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.textPrimary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Show all ${amenities.length} amenities',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'Urbanist',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String amenity) {
    final lower = amenity.toLowerCase();
    if (lower.contains('indoor')) return Icons.home_outlined;
    if (lower.contains('outdoor')) return Icons.park_outlined;
    if (lower.contains('parking')) return Icons.local_parking_outlined;
    if (lower.contains('wifi')) return Icons.wifi;
    if (lower.contains('air')) return Icons.ac_unit_outlined;
    if (lower.contains('sound') || lower.contains('music')) return Icons.speaker_outlined;
    if (lower.contains('stage')) return Icons.theater_comedy_outlined;
    if (lower.contains('kitchen')) return Icons.kitchen_outlined;
    if (lower.contains('pool')) return Icons.pool_outlined;
    if (lower.contains('garden')) return Icons.local_florist_outlined;
    if (lower.contains('beach') || lower.contains('sea')) return Icons.beach_access_outlined;
    if (lower.contains('view')) return Icons.landscape_outlined;
    if (lower.contains('bar')) return Icons.local_bar_outlined;
    if (lower.contains('restaurant')) return Icons.restaurant_outlined;
    if (lower.contains('pet')) return Icons.pets_outlined;
    if (lower.contains('mountain')) return Icons.terrain_outlined;
    if (lower.contains('roof')) return Icons.roofing_outlined;
    if (lower.contains('lake')) return Icons.water_outlined;
    if (lower.contains('heritage') || lower.contains('art')) return Icons.museum_outlined;
    if (lower.contains('vip') || lower.contains('lounge')) return Icons.star_outline;
    if (lower.contains('fairy') || lower.contains('light')) return Icons.lightbulb_outlined;
    if (lower.contains('private')) return Icons.lock_outline;
    if (lower.contains('open air') || lower.contains('fresh')) return Icons.air_outlined;
    return Icons.check_circle_outline;
  }
}
