import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/branding/app_logo.dart';

class SupportHeader extends StatelessWidget {
  const SupportHeader({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLogo(size: compact ? 96 : 120),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'الدعم الفني',
          textAlign: TextAlign.center,
          style: compact ? AppTextStyles.h3 : AppTextStyles.h2,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'واجهتك مشكلة في تطبيق ادواتك؟ اكتب لنا تفاصيلها وسنتواصل معك على بريدك الإلكتروني في أقرب وقت.',
          textAlign: TextAlign.center,
          style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
