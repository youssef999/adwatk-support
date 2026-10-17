import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  static const String contentId = 'support_content';

  static const int messageMinLength = 10;
  static const int messageMaxLength = 2000;

  static final RegExp _emailPattern =
      RegExp(r'^[\w.+-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}$');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isSubmitted = false;

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'من فضلك أدخل بريدك الإلكتروني';
    if (!_emailPattern.hasMatch(email)) return 'البريد الإلكتروني غير صحيح';
    return null;
  }

  String? validateMessage(String? value) {
    final message = value?.trim() ?? '';
    if (message.isEmpty) return 'من فضلك اكتب مشكلتك';
    if (message.length < messageMinLength) {
      return 'اكتب وصفًا أوضح للمشكلة ($messageMinLength أحرف على الأقل)';
    }
    if (message.length > messageMaxLength) {
      return 'الرسالة طويلة جدًا (الحد الأقصى $messageMaxLength حرف)';
    }
    return null;
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isSubmitted = true;
    update([contentId]);
  }

  void startNewRequest() {
    emailController.clear();
    messageController.clear();
    isSubmitted = false;
    update([contentId]);
  }

  @override
  void onClose() {
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
