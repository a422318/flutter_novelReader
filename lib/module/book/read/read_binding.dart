import 'package:book_app/module/book/read/read_controller.dart';
import 'package:get/get.dart';

class ReadBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReadController>(ReadController());
  }

}
