import 'package:get/get.dart';

import '../controllers/edit_store_info_controller.dart';

class EditStoreInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditStoreInfoController>(
      () => EditStoreInfoController(),
    );
  }
}
