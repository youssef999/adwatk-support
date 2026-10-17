import 'package:get/get.dart';

import '../../features/support/bindings/support_binding.dart';
import '../../features/support/pages/support_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.support,
      page: () => const SupportPage(),
      binding: SupportBinding(),
    ),
  ];
}
