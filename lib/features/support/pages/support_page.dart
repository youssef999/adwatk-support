import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/breakpoints.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/cards/app_card.dart';
import '../controllers/support_controller.dart';
import '../widgets/support_form.dart';
import '../widgets/support_header.dart';
import '../widgets/support_success_view.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  static const double _contentMaxWidth = 560;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = Breakpoints.isMobile(constraints.maxWidth);
          final padding = isMobile ? AppSpacing.md : AppSpacing.xl;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
              vertical: isMobile ? AppSpacing.xl : AppSpacing.xxl,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
                child: Column(
                  children: [
                    SupportHeader(compact: isMobile),
                    const SizedBox(height: AppSpacing.xl),
                    AppCard(
                      padding: EdgeInsets.all(
                        isMobile ? AppSpacing.lg : AppSpacing.xl,
                      ),
                      child: GetBuilder<SupportController>(
                        id: SupportController.contentId,
                        builder: (c) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: c.isSubmitted
                              ? const SupportSuccessView(key: ValueKey('success'))
                              : const SupportForm(key: ValueKey('form')),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      '© ${DateTime.now().year} ادواتك — للوساطة في أدوات السيارات',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
