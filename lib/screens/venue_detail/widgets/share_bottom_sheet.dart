import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/venue.dart';

class ShareBottomSheet extends StatelessWidget {
  final Venue venue;

  const ShareBottomSheet({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // Header
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Share this venue',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.surfaceVariant,
                  ),
                  child: const Icon(Icons.close, size: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Venue info row
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.location_city,
                  color: AppColors.textTertiary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      venue.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'Urbanist',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      venue.city,
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
          const SizedBox(height: 24),
          // Share options grid
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildShareOption(Icons.link, 'Copy Link', () {
                Navigator.pop(context);
              }),
              _buildShareOption(Icons.message_outlined, 'Messages', () {
                Navigator.pop(context);
              }),
              _buildShareOption(Icons.chat_bubble_outline, 'Messenger', () {
                Navigator.pop(context);
              }),
              _buildShareOption(Icons.alternate_email, 'Twitter', () {
                Navigator.pop(context);
              }),
              _buildShareOption(Icons.email_outlined, 'Email', () {
                Navigator.pop(context);
              }),
              _buildShareOption(Icons.phone, 'WhatsApp', () {
                Navigator.pop(context);
              }),
              _buildShareOption(Icons.facebook_outlined, 'Facebook', () {
                Navigator.pop(context);
              }),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Once you share this link, anyone can view this venue.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textTertiary,
              fontFamily: 'Urbanist',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildShareOption(
      IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderLight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: AppColors.textPrimary),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
                fontFamily: 'Urbanist',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
