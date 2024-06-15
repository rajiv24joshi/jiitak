import 'package:get/get.dart';

import '../modules/edit_store_info/bindings/edit_store_info_binding.dart';
import '../modules/edit_store_info/views/edit_store_info_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/stamp_detail/bindings/stamp_detail_binding.dart';
import '../modules/stamp_detail/views/stamp_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.STAMP_DETAIL,
      page: () => const StampDetailView(),
      binding: StampDetailBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_STORE_INFO,
      page: () => const EditStoreInfoView(),
      binding: EditStoreInfoBinding(),
    ),
  ];
}
