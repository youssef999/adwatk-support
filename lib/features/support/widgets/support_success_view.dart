import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/app_button.dart';
import '../controllers/support_controller.dart';

class SupportSuccessView extends StatelessWidget {
  const SupportSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupportController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: const Icon(
            Icons.check_circle_rounded,
            color: AppColors.success,
            size: AppIconSize.xxl,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const Text(
          'تم إرسال طلبك',
          textAlign: TextAlign.center,
          style: AppTextStyles.h4,
        ),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'شكرًا لتواصلك معنا. استلمنا مشكلتك وسيتواصل معك فريق الدعم على بريدك الإلكتروني في أقرب وقت.',
          textAlign: TextAlign.center,
          style: AppTextStyles.body2,
        ),
        const SizedBox(height: AppSpacing.xl),
        AppButton(
          label: 'إرسال طلب آخر',
          icon: Icons.add_comment_outlined,
          variant: AppButtonVariant.outlined,
          isExpanded: true,
          onPressed: controller.startNewRequest,
        ),
      ],
    );
  }
}
