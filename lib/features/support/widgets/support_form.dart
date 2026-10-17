import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/buttons/app_button.dart';
import '../../../shared/widgets/inputs/app_text_field.dart';
import '../controllers/support_controller.dart';

class SupportForm extends StatelessWidget {
  const SupportForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupportController>();

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            label: 'البريد الإلكتروني',
            hint: 'example@email.com',
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: controller.validateEmail,
            suffixIcon: const Icon(Icons.alternate_email_rounded),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(
            label: 'المشكلة',
            hint: 'اشرح المشكلة التي تواجهها بالتفصيل...',
            controller: controller.messageController,
            keyboardType: TextInputType.multiline,
            maxLines: 6,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: controller.validateMessage,
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: 'إرسال الطلب',
            icon: Icons.send_rounded,
            isExpanded: true,
            onPressed: controller.submit,
          ),
        ],
      ),
    );
  }
}
