import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class HostInfoWidget extends StatelessWidget {
  final String hostName;
  final String? hostImage;
  final int daysHosting;
  final double communicationRating;
  final double easeOfCheckIn;
  final double cancellationRate;

  const HostInfoWidget({
    super.key,
    required this.hostName,
    this.hostImage,
    this.daysHosting = 0,
    this.communicationRating = 0,
    this.easeOfCheckIn = 0,
    this.cancellationRate = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primaryContainer,
                child: hostImage != null
                    ? ClipOval(
                        child: Image.network(
                          hostImage!,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Text(
                            hostName[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    : Text(
                        hostName[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hosted by $hostName',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Host · $daysHosting days hosting',
                      style: const TextStyle(
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
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 62),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See host profile',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Rating cards
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                _buildRatingItem(
                  '${communicationRating.toStringAsFixed(0)}/10',
                  'Communication\nrating',
                ),
                _buildVerticalDivider(),
                _buildRatingItem(
                  '${easeOfCheckIn.toStringAsFixed(0)}/10',
                  'Ease of\ncheck-in',
                ),
                _buildVerticalDivider(),
                _buildRatingItem(
                  '${cancellationRate.toStringAsFixed(0)}%',
                  'Cancellation\nrate',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Contact host button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.textPrimary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              'Contact host',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontFamily: 'Urbanist',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingItem(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.primary,
              fontFamily: 'Urbanist',
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: AppColors.primary.withValues(alpha: 0.2),
    );
  }
}
