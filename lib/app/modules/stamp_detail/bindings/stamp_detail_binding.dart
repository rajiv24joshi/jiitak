import 'package:get/get.dart';

import '../controllers/stamp_detail_controller.dart';

class StampDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StampDetailController>(
      () => StampDetailController(),
    );
  }
}
