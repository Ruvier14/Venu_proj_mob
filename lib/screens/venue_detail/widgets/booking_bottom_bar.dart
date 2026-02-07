import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class BookingBottomBar extends StatelessWidget {
  final double price;
  final VoidCallback onReserve;

  const BookingBottomBar({
    super.key,
    required this.price,
    required this.onReserve,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '₱${_formatPrice(price)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        const TextSpan(
                          text: ' per event',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Add date for total',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: onReserve,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                ),
                child: const Text(
                  'Reserve',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
            ),
          ],
        ),
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
