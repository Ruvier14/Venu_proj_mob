import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/venue.dart';

class HouseRulesWidget extends StatelessWidget {
  final HouseRules rules;

  const HouseRulesWidget({super.key, required this.rules});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'House Rules',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 16),
          _buildRuleRow(Icons.access_time, 'Check in after ${rules.checkIn}'),
          _buildRuleRow(
              Icons.access_time_outlined, 'Check out before ${rules.checkOut}'),
          _buildRuleRow(Icons.child_care, 'Children: ${rules.children}'),
          _buildRuleRow(Icons.pets_outlined, rules.pets),
          _buildRuleRow(Icons.celebration_outlined, rules.events),
          _buildRuleRow(Icons.smoke_free, rules.smoking),
          _buildRuleRow(Icons.person_outline,
              'Minimum age to rent: ${rules.minAge}'),
          if (rules.checkoutInstructions.isNotEmpty) ...[
            const SizedBox(height: 20),
            const Text(
              'Check-out instructions',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontFamily: 'Urbanist',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'The host requires you complete the following before checking out:',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontFamily: 'Urbanist',
              ),
            ),
            const SizedBox(height: 8),
            ...rules.checkoutInstructions.map(
              (instruction) => Padding(
                padding: const EdgeInsets.only(left: 16, top: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '•  ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        instruction,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRuleRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textPrimary),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
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
  }
}
