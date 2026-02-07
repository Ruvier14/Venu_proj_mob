import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(height: 24),
              // Profile card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.primaryContainer,
                      child: Image.asset(
                        AppAssets.userImage,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign in to Venu',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Book venues, save wishlists, and more',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.textTertiary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Menu sections
              _buildSectionTitle('Account'),
              _buildMenuItem(Icons.person_outline, 'Personal info'),
              _buildMenuItem(Icons.security_outlined, 'Login & security'),
              _buildMenuItem(Icons.payment_outlined, 'Payments'),
              _buildMenuItem(Icons.notifications_outlined, 'Notifications'),
              const SizedBox(height: 24),
              _buildSectionTitle('Hosting'),
              _buildMenuItem(Icons.home_work_outlined, 'List your place'),
              _buildMenuItem(Icons.swap_horiz, 'Switch to hosting'),
              const SizedBox(height: 24),
              _buildSectionTitle('Support'),
              _buildMenuItem(Icons.help_outline, 'Help Center'),
              _buildMenuItem(Icons.book_outlined, 'FAQs'),
              _buildMenuItem(Icons.flag_outlined, 'Report'),
              _buildMenuItem(Icons.shield_outlined, 'Service Guarantee'),
              const SizedBox(height: 24),
              _buildSectionTitle('Legal'),
              _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
              _buildMenuItem(Icons.cookie_outlined, 'Cookie Policy'),
              _buildMenuItem(Icons.description_outlined, 'Terms & Conditions'),
              const SizedBox(height: 32),
              // Version
              Center(
                child: Text(
                  'Venu v1.0.0',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textTertiary,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textTertiary,
          letterSpacing: 0.5,
          fontFamily: 'Urbanist',
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: AppColors.textPrimary, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            fontFamily: 'Urbanist',
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 20,
          color: AppColors.textTertiary,
        ),
        onTap: () {},
        dense: true,
      ),
    );
  }
}
