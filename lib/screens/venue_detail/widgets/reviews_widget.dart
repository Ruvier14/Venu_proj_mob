import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/venue.dart';

class ReviewsWidget extends StatelessWidget {
  final List<Review> reviews;
  final double overallRating;
  final int reviewCount;

  const ReviewsWidget({
    super.key,
    required this.reviews,
    required this.overallRating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reviews',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 16),
          // Overall rating card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${overallRating.toStringAsFixed(1)}/10',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getRatingLabel(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$reviewCount verified reviews',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite, size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            'Loved by Guests',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Review cards
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: reviews.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return _buildReviewCard(reviews[index]);
              },
            ),
          ),
          if (reviewCount > 2) ...[
            const SizedBox(height: 20),
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
                'Show all $reviewCount reviews',
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

  Widget _buildReviewCard(Review review) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${review.rating.toStringAsFixed(0)}/10 ${_getRatingLabelForScore(review.rating)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              review.comment,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontFamily: 'Urbanist',
                height: 1.4,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Show more',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                decoration: TextDecoration.underline,
                fontFamily: 'Urbanist',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.primaryContainer,
                child: Text(
                  review.userName[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    if (review.isVerified)
                      Text(
                        'Stayed · ${review.date} · Verified review',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textTertiary,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getRatingLabel() {
    if (overallRating >= 9) return 'Exceptional';
    if (overallRating >= 8) return 'Excellent';
    if (overallRating >= 7) return 'Very Good';
    if (overallRating >= 6) return 'Good';
    return 'Average';
  }

  String _getRatingLabelForScore(double score) {
    if (score >= 9) return 'Exceptional';
    if (score >= 8) return 'Excellent';
    if (score >= 7) return 'Very Good';
    if (score >= 6) return 'Good';
    return 'Average';
  }
}
